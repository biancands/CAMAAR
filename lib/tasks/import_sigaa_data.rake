# lib/tasks/import_sigaa_data.rake
namespace :db do
  desc "Importar dados do SIGAA de forma segura e eficiente"
  task import_sigaa_data: :environment do
    ImportSigaaService.new.import
  end
end
