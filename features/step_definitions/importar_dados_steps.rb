Given('que os dados do SIGAA estão disponíveis no formato JSON') do
  @sigaa_json = File.read(Rails.root.join('spec', 'fixtures', 'sigaa_dados.json'))
end

Given('os arquivos não possuem dados duplicados') do
  @dados_unicos = JSON.parse(@sigaa_json).uniq
  expect(@dados_unicos.size).to eq(JSON.parse(@sigaa_json).size)
end

When('eu importo os dados do SIGAA') do
  post "/importar_dados", params: { arquivo: @sigaa_json }
end

Then('os dados de turmas, matérias e participantes são salvos na base de dados') do
  expect(Turma.count).to be > 0
  expect(Disciplina.count).to be > 0
  expect(Usuario.count).to be > 0
end

Then('nenhuma duplicação ocorre') do
  expect(Usuario.pluck(:email).uniq.size).to eq(Usuario.count)
end
