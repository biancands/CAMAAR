require "json"
# issue 100 - Importação de usuários
class ImportUsuariosService
  def self.import_from_json(file_path)
    file = File.read(file_path)
    data = JSON.parse(file)

    data.each do |turma|
      next unless turma["dicente"]

      turma["dicente"].each do |usuario_data|
        usuario = Usuario.find_or_initialize_by(email: usuario_data["email"])

        if usuario.new_record?
          usuario.assign_attributes(
            nome: usuario_data["nome"],
            email: usuario_data["email"],
            password_digest: SecureRandom.hex(10),
            tipo: "dicente",
            matricula: usuario_data["matricula"]
          )

          if usuario.save
            puts "✅ Usuário #{usuario.nome} cadastrado com sucesso!"
          else
            puts "Erro ao cadastrar usuário #{usuario.nome}: #{usuario.errors.full_messages.join(', ')}"
          end
        else
          puts "ℹ️ Usuário #{usuario.nome} já existe. Pulando..."
        end
      end
    end
  end
end
