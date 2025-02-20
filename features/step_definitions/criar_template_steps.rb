Given('que existe um Administrador {string}') do |nome|
  @admin = Usuario.create!(nome: nome, email: "admin@example.com", tipo: "Admin", password: "senha123")
  login_as(@admin, scope: :usuario)
end

When('o Administrador cria um template chamado {string} com questões') do |template_nome|
  visit new_template_path
  fill_in "Nome", with: template_nome
  click_button "Adicionar Pergunta"
  fill_in "Questão 1", with: "O que você achou da disciplina?"
  select "Múltipla escolha", from: "Tipo de resposta"
  click_button "Salvar"
end

Then('o template deve ser salvo no sistema') do
  expect(Template.last.nome).not_to be_nil
end

Then('o sistema deve exibir a mensagem {string}') do |mensagem|
  expect(page).to have_content(mensagem)
end
