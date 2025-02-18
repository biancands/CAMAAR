# == Descrição
#
# Este script é utilizado para popular o banco de dados com dados iniciais.
# No caso específico, ele cria um usuário administrador com credenciais padrão.
#
# == Uso
#
# rails db:seed issue 100 - Importação de usuários
#
# == Dependências
#
# Requer o serviço de importação de usuários localizado em:
# '../app/services/import_usuarios_service'
#
# == Funcionalidade
#
# 1. Criação de um usuário admin com as seguintes características:
#    - Nome: 'Admin'
#    - Email: 'admin@example.com'
#    - Senha: 'senha123'
#    - Admin: true
#    - Tipo: 'Admin'
#
# 2. Exibe uma mensagem de sucesso após a criação do usuário admin.
# Usage: rails db:seed issue 100 - Importação de usuários
require_relative '../app/services/import_usuarios_service'

# Criação de um usuário admin
Usuario.create!(
  nome: 'Admin',
  email: 'admin@example.com',
  password: 'senha123',
  admin: true,
  tipo: 'Admin'
  )

puts "✅ Usuário admin criado com sucesso!"
