Given('que existe um usuário com email {string} sem senha definida') do |email|
  @usuario = Usuario.create!(email: email, password_digest: nil)
end

When('o usuário solicita a definição de senha e insere {string}') do |senha|
  visit definir_senha_path(@usuario)
  fill_in "Nova Senha", with: senha
  fill_in "Confirme a Senha", with: senha
  click_button "Salvar"
end

Then('a senha do usuário deve ser definida como {string}') do |senha|
  expect(@usuario.reload.authenticate(senha)).to be_truthy
end

Then('o usuário deve receber a mensagem {string}') do |mensagem|
  expect(page).to have_content(mensagem)
end

Then('a senha do usuário não deve ser salva') do
  expect(@usuario.reload.password_digest).to be_nil
end
