Dado("que existem arquivos JSON válidos do SIGAA") do
  @dados_json = File.read(Rails.root.join('spec', 'fixtures', 'sigaa.json'))
end

Quando("executo a task de importação") do
  ImportacaoService.new(@dados_json).executar
end

Então("o sistema deve ter:") do |table|
  table.hashes.each do |row|
    modelo = row["Modelo"].constantize
    quantidade = row["Quantidade"].to_i
    expect(modelo.count).to eq(quantidade)
  end
end

Então("as associações entre turmas e usuários devem existir") do
  Turma.includes(:usuarios).each do |turma|
    expect(turma.usuarios.exists?).to be_truthy
  end
end
