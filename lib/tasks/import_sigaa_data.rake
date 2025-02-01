# lib/tasks/import_sigaa_data.rake
namespace :db do
  desc "Importar dados do SIGAA de forma segura e eficiente"
  task import_sigaa_data: :environment do
    require "json"
    require "bcrypt"
    require "stringio"

    # Modificação do método log
    def log(message)
      puts "[#{Time.now}] #{message}"
      Rails.logger.info("[SIGAA Import] #{message}") if defined?(Rails)
    end

    begin
      ActiveRecord::Base.transaction do
        # Carregar arquivos JSON
        classes_json = JSON.parse(File.read(Rails.root.join("db", "data", "classes.json")))
        class_members_json = JSON.parse(File.read(Rails.root.join("db", "data", "class_members.json")))

        # 1. Importar Disciplinas
        log "Processando disciplinas..."
        disciplinas = classes_json.map do |disciplina|
          {
            codigo: disciplina["code"],
            nome: disciplina["name"],
            descricao: "Importada do SIGAA em #{Time.now.strftime('%d/%m/%Y')}"
          }
        end
        # Remove duplicados baseados no código
        disciplinas.uniq! { |d| d[:codigo] }
        Disciplina.upsert_all(disciplinas, unique_by: :codigo)

        # 2. Importar Turmas
        log "Processando turmas..."
        turmas = classes_json.map do |disciplina|
          {
            codigo: "#{disciplina['code']}-#{disciplina.dig('class', 'classCode')}",
            nome: "#{disciplina['name']} (#{disciplina.dig('class', 'classCode')})",
            periodo: disciplina.dig("class", "semester"),
            disciplina_id: Disciplina.find_by(codigo: disciplina["code"]).id
          }
        end
        # Remove duplicados baseados no código
        turmas.uniq! { |t| t[:codigo] }
        Turma.upsert_all(turmas, unique_by: :codigo)

        # 3. Importar Usuários
        log "Processando usuários..."
        usuarios = []
        class_members_json.each do |turma|
          # Docente
          docente = turma["docente"]
          usuarios << {
            matricula: docente["usuario"],
            nome: docente["nome"],
            email: docente["email"],
            tipo: "Docente",
            password_digest: BCrypt::Password.create(SecureRandom.hex(10))
          }

          # Discentes
          turma["dicente"].each do |aluno|
            usuarios << {
              matricula: aluno["usuario"],
              nome: aluno["nome"],
              email: aluno["email"],
              tipo: "Discente",
              password_digest: BCrypt::Password.create(SecureRandom.hex(10))
            }
          end
        end
        # Remove duplicados baseados na matrícula
        usuarios.uniq! { |u| u[:matricula] }
        Usuario.upsert_all(
          usuarios,
          unique_by: :matricula,
          update_only: [ :nome, :email, :tipo, :password_digest ]
        )

        # 4. Associar Usuários às Turmas
        log "Associando usuários às turmas..."
        class_members_json.each do |turma_data|
          begin
            turma = Turma.find_by!(
              codigo: "#{turma_data['code']}-#{turma_data['classCode']}",
              periodo: turma_data["semester"]
            )

            matriculas = [ turma_data.dig("docente", "usuario") ] +
                        turma_data["dicente"].map { |a| a["usuario"] }

            usuarios = Usuario.where(matricula: matriculas)
            turma.usuarios.destroy_all
            turma.usuarios << usuarios

            log "-> Associados #{usuarios.count} usuários à turma #{turma.codigo}"
          rescue ActiveRecord::RecordNotFound => e
            log "ERRO: Turma não encontrada - #{e.message}"
          end
        end

        # 5. Registrar Importação (Corrigido para usar a tabela sigaas)
        log "Registrando importação..."
        Sigaa.create!(
          tipo_dado: "Importação Completa",
          ultima_atualizacao: Time.current,
          detalhes: {
            disciplinas: Disciplina.count,
            turmas: Turma.count,
            usuarios: Usuario.count,
            associacoes: Turma.joins(:usuarios).count
          }
        )

        log "Importação concluída com sucesso!"
        log "Estatísticas:"
        log "-> Disciplinas: #{Disciplina.count}"
        log "-> Turmas: #{Turma.count}"
        log "-> Usuários: #{Usuario.count}"
        log "-> Associações Turma-Usuário: #{Turma.joins(:usuarios).count}"
      end

    rescue ActiveRecord::RecordInvalid => e
      log "ERRO DE VALIDAÇÃO: #{e.record.errors.full_messages.join(', ')}"
      raise ActiveRecord::Rollback
    rescue StandardError => e
      log "ERRO CRÍTICO: #{e.message}"
      log "Backtrace: #{e.backtrace.first(5).join("\n")}"
      raise ActiveRecord::Rollback
    end
  end
end
