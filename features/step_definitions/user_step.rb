Given('Eu solicitei a redefinição de senha para o e-mail {string}') do |email|
  visit senha_redefinir_path
  fill_in "E-mail", with: email
  click_button "Enviar"
end

Given('Eu recebo um e-mail com o link de redefinição') do
  @usuario = Usuario.find_by(email: "usuario@exemplo.com")
  @token = SecureRandom.hex(10)
  @usuario.update(reset_password_token: @token, reset_password_sent_at: Time.now)
end

When('Eu acesso o link de redefinição') do
  visit redefinir_senha_path(token: @token)
end

When('Eu insiro uma nova senha {string}') do |senha|
  fill_in "Nova Senha", with: senha
  fill_in "Confirme a Senha", with: senha
  click_button "Salvar"
end

Then('Minha senha deve ser redefinida com sucesso') do
  expect(page).to have_content("Senha redefinida com sucesso")
end

When('O sistema verifica o e-mail') do
  expect(Usuario.find_by(email: "usuarioinvalido@exemplo.com")).to be_nil
end

When('Eu acesso o link após o prazo de validade') do
  @usuario.update(reset_password_sent_at: 3.days.ago)
  visit redefinir_senha_path(token: @token)
end
