require "json"
require "securerandom"
# issue: 100 - Importar usuários e issue 105 - Enviar e-mail de ativação
class ImportUsuariosService
  def self.import_from_json(file_path)
    file = File.read(file_path)
    data = JSON.parse(file)

    data.each do |turma|
      next unless turma["dicente"]

      turma["dicente"].each do |usuario_data|
        usuario = Usuario.find_or_initialize_by(email: usuario_data["email"])

        if usuario.new_record?
          token = SecureRandom.hex(10)

          usuario.assign_attributes(
            nome: usuario_data["nome"],
            email: usuario_data["email"],
            password_digest: SecureRandom.hex(10),
            tipo: "dicente",
            matricula: usuario_data["matricula"],
            activation_token: token,
            activation_token_sent_at: Time.current
          )

          if usuario.save
            puts "✅ Usuário #{usuario.nome} cadastrado com sucesso!"
            puts "🔹 Token gerado para #{usuario.email}: #{token}"

            # Enviar e-mail com o token
            UsuarioMailer.with(usuario: usuario, token: token).activation_email.deliver_now
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
