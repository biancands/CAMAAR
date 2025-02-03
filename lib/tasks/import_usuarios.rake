# Usage: rails import:usuarios issue 100 - Importação de usuários
namespace :import do
  desc "Importa usuários do SIGAA para o sistema"
  task usuarios: :environment do
    file_path = Rails.root.join("db", "data", "class_members.json")

    if File.exist?(file_path)
      puts "📥 Iniciando importação de usuários..."
      ImportUsuariosService.import_from_json(file_path)
      puts "✅ Importação concluída!"
    else
      puts "❌ Arquivo não encontrado: #{file_path}"
    end
  end
end
