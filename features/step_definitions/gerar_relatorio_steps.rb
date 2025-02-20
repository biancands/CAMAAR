Given('que existe um formulário {string} com respostas') do |titulo|
  @formulario = Formulario.create!(titulo: titulo)
  @resposta1 = Resposta.create!(formulario: @formulario, usuario: Usuario.first, conteudo: "Ótimo")
  @resposta2 = Resposta.create!(formulario: @formulario, usuario: Usuario.last, conteudo: "Bom")
end

When('o Administrador solicita o relatório do formulário {string}') do |titulo|
  visit gerar_relatorio_path(Formulario.find_by(titulo: titulo))
end

Then('o sistema deve gerar um arquivo CSV com os resultados') do
  expect(page.response_headers['Content-Type']).to include('text/csv')
end

Then('o Administrador deve conseguir fazer o download do arquivo') do
  expect(page).to have_link("Download CSV")
end

Given('que existe um formulário {string} sem respostas') do |titulo|
  @formulario = Formulario.create!(titulo: titulo)
end

Then('o sistema deve exibir a mensagem {string}') do |mensagem|
  expect(page).to have_content(mensagem)
end
