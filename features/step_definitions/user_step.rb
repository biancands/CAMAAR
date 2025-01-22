Given('Eu solicitei a redefinição de senha para o e-mail {string}') do |email|
  # Validação de entrada de e-mail.
  if email.include?('@')
    puts "E-mail válido: #{email}"
  else
    puts "E-mail inválido: #{email}"
  end
  pending
end

Given('Eu recebo um e-mail com o link de redefinição') do
  pending
end

When('Eu acesso o link de redefinição') do
  pending
end

When('Eu insiro uma nova senha {string}') do |senha|
  # Validações básicas para senha.
  if senha.length >= 8
    puts "Senha válida."
  else
    puts "Senha inválida (muito curta)."
  end
  pending
end

Then('Minha senha deve ser redefinida com sucesso') do
  pending
end

When('O sistema verifica o e-mail') do
  pending
end

When('Eu acesso o link após o prazo de validade') do
  pending
end
