Given('que existe um usuário com email {string} e senha {string}') do |email, senha|
  @usuario = Usuario.create!(email: email, password: senha)
end

When('o usuário tenta logar com email {string} e senha {string}') do |email, senha|
  visit login_path
  fill_in "Email", with: email
  fill_in "Senha", with: senha
  click_button "Entrar"
end

Then('o login deve ser realizado com sucesso') do
  expect(page).to have_content("Bem-vindo")
end

Then('uma mensagem de erro {string} deve ser exibida') do |mensagem|
  expect(page).to have_content(mensagem)
end
