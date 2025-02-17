Dado("que existem arquivos JSON válidos do SIGAA") do
  ImportacaoService.setup_valid_json_files
end

Quando("executo a task de importação") do
  ImportacaoService.run_import_task
end

Então("o sistema deve ter:") do |table|
  verify_record_counts(table)
end

Então("as associações entre turmas e usuários devem existir") do
  verify_associations
end

private

def verify_record_counts(table)
  table.hashes.each do |row|
    model_class = row["Modelo"].constantize
    expected_count = row["Quantidade"].to_i
    expect(model_class.count).to eq(expected_count)
  end
end

def verify_associations
  Turma.includes(:usuarios).each do |turma|
    expect(turma.usuarios.exists?).to be true
    expect(turma.usuarios.where(tipo: "Docente").exists?).to be true
  end
end
