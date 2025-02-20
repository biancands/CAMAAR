# Service para lidar com a importação de dados do SIGAA
class ImportacaoService
    require "json"

    # Configura arquivos JSON válidos para a importação
    def self.setup_valid_json_files
      classes = [
        { "code" => "MAT101", "name" => "Cálculo I", "class" => { "classCode" => "T1", "semester" => "2023.1" } },
        { "code" => "MAT101", "name" => "Cálculo I", "class" => { "classCode" => "T2", "semester" => "2023.1" } },
        { "code" => "FIS102", "name" => "Física II", "class" => { "classCode" => "T1", "semester" => "2023.1" } }
      ]

      members = [
        { "code" => "MAT101", "classCode" => "T1", "semester" => "2023.1", "docente" => { "usuario" => "prof1", "nome" => "João Silva", "email" => "joao@uni.edu" }, "dicente" => [ { "usuario" => "aluno1", "nome" => "Maria Souza", "email" => "maria@uni.edu" } ] },
        { "code" => "MAT101", "classCode" => "T2", "semester" => "2023.1", "docente" => { "usuario" => "prof2", "nome" => "Ana Costa", "email" => "ana@uni.edu" }, "dicente" => [ { "usuario" => "aluno2", "nome" => "Pedro Alves", "email" => "pedro@uni.edu" } ] },
        { "code" => "FIS102", "classCode" => "T1", "semester" => "2023.1", "docente" => { "usuario" => "prof3", "nome" => "Ricardo Santos", "email" => "ricardo@uni.edu" }, "dicente" => [ { "usuario" => "aluno3", "nome" => "Juliana Moraes", "email" => "juliana@uni.edu" } ] }
      ]

      FileUtils.mkdir_p("db/data")
      File.write("db/data/classes.json", classes.to_json)
      File.write("db/data/class_members.json", members.to_json)
    end

    # Executa a task de importação do Rake
    def self.run_import_task
      Rake::Task["db:import_sigaa_data"].reenable
      Rake::Task["db:import_sigaa_data"].invoke
    end
end
