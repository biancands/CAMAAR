Dado('que existem arquivos JSON válidos do SIGAA') do
  setup_valid_json_files
end

Quando('executo a task de importação') do
  run_import_task
end

Então('o sistema deve ter:') do |table|
  verify_record_counts(table)
end

Então('as associações entre turmas e usuários devem existir') do
  verify_associations
end

private

def setup_valid_json_files
  classes = [
    {
      "code" => "MAT101",
      "name" => "Cálculo I",
      "class" => {
        "classCode" => "T1",
        "semester" => "2023.1"
      }
    },
    {
      "code" => "MAT101",
      "name" => "Cálculo I",
      "class" => {
        "classCode" => "T2",
        "semester" => "2023.1"
      }
    },
    {
      "code" => "FIS102",
      "name" => "Física II",
      "class" => {
        "classCode" => "T1",
        "semester" => "2023.1"
      }
    }
  ]

  members = [
    {
      "code" => "MAT101",
      "classCode" => "T1",
      "semester" => "2023.1",
      "docente" => {
        "usuario" => "prof1",
        "nome" => "João Silva",
        "email" => "joao@uni.edu"
      },
      "dicente" => [
        {
          "usuario" => "aluno1",
          "nome" => "Maria Souza",
          "email" => "maria@uni.edu"
        }
      ]
    },
    {
      "code" => "MAT101",
      "classCode" => "T2",
      "semester" => "2023.1",
      "docente" => {
        "usuario" => "prof2",
        "nome" => "Ana Costa",
        "email" => "ana@uni.edu"
      },
      "dicente" => [
        {
          "usuario" => "aluno2",
          "nome" => "Pedro Alves",
          "email" => "pedro@uni.edu"
        }
      ]
    },
    {
      "code" => "FIS102",
      "classCode" => "T1",
      "semester" => "2023.1",
      "docente" => {
        "usuario" => "prof3",
        "nome" => "Ricardo Santos",
        "email" => "ricardo@uni.edu"
      },
      "dicente" => [
        {
          "usuario" => "aluno3",
          "nome" => "Juliana Moraes",
          "email" => "juliana@uni.edu"
        }
      ]
    }
  ]

  FileUtils.mkdir_p('db/data')
  File.write('db/data/classes.json', classes.to_json)
  File.write('db/data/class_members.json', members.to_json)
end

def run_import_task
  Rake::Task['db:import_sigaa_data'].reenable
  Rake::Task['db:import_sigaa_data'].invoke
end

def verify_record_counts(table)
  table.hashes.each do |row|
    model_class = row['Modelo'].constantize
    expected_count = row['Quantidade'].to_i
    expect(model_class.count).to eq(expected_count)
  end
end

def verify_associations
  Turma.all.each do |turma|
    expect(turma.usuarios.count).to be > 0
    expect(turma.usuarios.where(tipo: 'Docente').exists?).to be true
  end
end
