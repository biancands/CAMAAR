require "json"
require "securerandom"
# issue: 100 - Importar usuários e issue 105 - Enviar e-mail de ativação
# Serviço para importar usuários a partir de um arquivo JSON.
#
# == Métodos de Classe:
# - import_from_json: Importa usuários a partir de um arquivo JSON especificado.
#
# === Exemplo de Uso:
#   ImportUsuariosService.import_from_json('/caminho/para/o/arquivo.json')
#
# === Detalhes do Método:
# [import_from_json(file_path)]
#   Lê o arquivo JSON especificado, parseia os dados e importa os usuários.
#   Para cada usuário, verifica se já existe no banco de dados pelo e-mail.
#   Se o usuário não existir, cria um novo registro com os dados fornecidos,
#   gera um token de ativação e envia um e-mail de ativação.
#   Se o usuário já existir, apenas informa que o usuário já está cadastrado.
#
# ==== Parâmetros:
# - +file_path+ - Caminho para o arquivo JSON contendo os dados dos usuários.
#
# ==== Exceções:
# - Levanta uma exceção se o arquivo JSON não puder ser lido ou parseado.
#
# ==== Exemplo de JSON:
#   [
#     {
#       "dicente": [
#         {
#           "nome": "Nome do Usuário",
#           "email": "email@exemplo.com",
#           "matricula": "123456"
#         }
#       ]
#     }
#   ]
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
