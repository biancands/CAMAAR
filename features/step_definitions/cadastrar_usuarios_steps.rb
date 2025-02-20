Given('que existem dados de participantes novos no SIGAA') do
  @dados_json = File.read(Rails.root.join('spec', 'fixtures', 'sigaa_participantes.json'))
end

Given('esses dados estão disponíveis no formato JSON') do
  expect(@dados_json).not_to be_empty
end

When('eu importo os dados de participantes') do
  post "/importar_participantes", params: { arquivo: @dados_json }
end

Then('os participantes são cadastrados no sistema') do
  expect(Usuario.count).to be > 0
end

Then('recebem credenciais de acesso.') do
  expect(Usuario.last.password_digest).not_to be_nil
end
