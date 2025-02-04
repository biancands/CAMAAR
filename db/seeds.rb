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
