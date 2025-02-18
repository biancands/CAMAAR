# app/services/sigaa_import_service.rb
# Serviço para importar dados do SIGAA para o sistema.
#
# Este serviço lê arquivos JSON contendo informações sobre disciplinas, turmas e usuários,
# e realiza a importação desses dados para o banco de dados da aplicação.
#
# @param data_dir [String] Diretório onde os arquivos JSON estão localizados. Padrão: "db/data".
#
# @example Uso básico
#   service = ImportSigaaService.new
#   service.import
#
# @note Este serviço utiliza transações do ActiveRecord para garantir a consistência dos dados.
#
# @!attribute [r] data_dir
#   @return [String] Diretório onde os arquivos JSON estão localizados.
#
# @!attribute [r] classes_json
#   @return [Array<Hash>] Dados das disciplinas e turmas extraídos do arquivo "classes.json".
#
# @!attribute [r] class_members_json
#   @return [Array<Hash>] Dados dos membros das turmas extraídos do arquivo "class_members.json".
#
# Métodos principais:
# @method import
#   Realiza a importação dos dados do SIGAA.
#   Envolve a importação de disciplinas, turmas, usuários e a associação de usuários às turmas.
#   Registra a importação no banco de dados.
#
# Métodos privados:
# @method log(message)
#   Registra uma mensagem de log com timestamp.
#   @param message [String] Mensagem a ser registrada.
#
# @method import_disciplinas
#   Importa as disciplinas a partir dos dados JSON.
#
# @method import_turmas
#   Importa as turmas a partir dos dados JSON.
#
# @method import_usuarios
#   Importa os usuários (docentes e discentes) a partir dos dados JSON.
#
# @method associate_usuarios_to_turmas
#   Associa os usuários às turmas correspondentes.
#
# @method register_import
#   Registra a importação no banco de dados, incluindo estatísticas sobre a importação.
class ImportSigaaService
  def initialize(data_dir: Rails.root.join("db", "data"))
    @data_dir = data_dir
    @classes_json = JSON.parse(File.read(@data_dir.join("classes.json")))
    @class_members_json = JSON.parse(File.read(@data_dir.join("class_members.json")))
  end

  def import
    log "Iniciando importação do SIGAA..."
    ActiveRecord::Base.transaction do
      import_disciplinas
      import_turmas
      import_usuarios
      associate_usuarios_to_turmas
      register_import
    end
  rescue ActiveRecord::RecordInvalid => e
    log "ERRO DE VALIDAÇÃO: #{e.record.errors.full_messages.join(', ')}"
    raise ActiveRecord::Rollback
  rescue StandardError => e
    log "ERRO CRÍTICO: #{e.message}"
    log "Backtrace: #{e.backtrace.first(5).join("\n")}"
    raise ActiveRecord::Rollback
  end

  private

  # Método de log unificado
  def log(message)
    puts "[#{Time.now}] #{message}"
    Rails.logger.info("[SIGAA Import] #{message}") if defined?(Rails)
  end

  def import_disciplinas
    log "Processando disciplinas..."
    disciplinas = @classes_json.map do |disciplina|
      {
        codigo: disciplina["code"],
        nome: disciplina["name"],
        descricao: "Importada do SIGAA em #{Time.now.strftime('%d/%m/%Y')}"
      }
    end
    disciplinas.uniq! { |d| d[:codigo] }
    Disciplina.upsert_all(disciplinas, unique_by: :codigo)
  end

  def import_turmas
    log "Processando turmas..."
    # Otimização: carregar de uma vez os IDs das disciplinas para evitar buscas repetidas
    disciplina_ids = Disciplina.pluck(:codigo, :id).to_h
    turmas = @classes_json.map do |disciplina|
      {
        codigo: "#{disciplina['code']}-#{disciplina.dig('class', 'classCode')}",
        nome: "#{disciplina['name']} (#{disciplina.dig('class', 'classCode')})",
        periodo: disciplina.dig("class", "semester"),
        horario: disciplina.dig("class", "time"),
        disciplina_id: disciplina_ids[disciplina["code"]]
      }
    end
    turmas.uniq! { |t| t[:codigo] }
    Turma.upsert_all(turmas, unique_by: :codigo)
  end

  def import_usuarios
    log "Processando usuários..."
    usuarios = []
    @class_members_json.each do |turma|
      # Importa o docente
      docente = turma["docente"]
      usuarios << {
        matricula: docente["usuario"],
        nome: docente["nome"],
        email: docente["email"],
        tipo: "Docente",
        password_digest: BCrypt::Password.create(SecureRandom.hex(10)),
        curso: nil,
        departamento: docente["departamento"],
        formacao: docente["formacao"]
      }

      # Importa os discentes
      turma["dicente"].each do |aluno|
        usuarios << {
          matricula: aluno["usuario"],
          nome: aluno["nome"],
          email: aluno["email"],
          tipo: "Discente",
          password_digest: BCrypt::Password.create(SecureRandom.hex(10)),
          curso: aluno["curso"] || nil,
          departamento: nil,
          formacao: nil
        }
      end
    end
    usuarios.uniq! { |u| u[:matricula] }
    Usuario.upsert_all(
      usuarios,
      unique_by: :matricula,
      update_only: [ :nome, :email, :tipo, :password_digest, :curso, :departamento, :formacao ]
    )
  end

  def associate_usuarios_to_turmas
    log "Associando usuários às turmas..."
    @class_members_json.each do |turma_data|
      begin
        turma = Turma.find_by!(
          codigo: "#{turma_data['code']}-#{turma_data['classCode']}",
          periodo: turma_data["semester"]
        )
        matriculas = [ turma_data.dig("docente", "usuario") ] + turma_data["dicente"].map { |a| a["usuario"] }
        usuarios = Usuario.where(matricula: matriculas)
        turma.usuarios.destroy_all
        turma.usuarios << usuarios
        log "-> Associados #{usuarios.count} usuários à turma #{turma.codigo}"
      rescue ActiveRecord::RecordNotFound => e
        log "ERRO: Turma não encontrada - #{e.message}"
      end
    end
  end

  def register_import
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
end
