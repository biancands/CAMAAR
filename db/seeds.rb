# Usage: rails db:seed issue 100 - Importação de usuários
require_relative '../app/services/import_usuarios_service'

file_path = Rails.root.join('db', 'data', 'class_members.json')
ImportUsuariosService.import_from_json(file_path)
