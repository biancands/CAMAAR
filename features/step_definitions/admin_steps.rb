Given('Eu sou um administrador autenticado') do
  @admin = Usuario.create!(nome: "Admin", email: "admin@example.com", tipo: "Admin", password: "senha123")
  login_as(@admin, scope: :usuario) # Simula login do Devise
  puts "Administrador autenticado: #{@admin.nome}"
end

Given('Existe pelo menos uma turma cadastrada no sistema') do
  @turma = Turma.create!(codigo: "123", nome: "Turma A", periodo: "2023.1")
  puts "Turma cadastrada: #{@turma.nome}"
end

When('Eu acesso a página de criação de formulários') do
  visit new_formulario_path
  expect(page).to have_content("Criar Formulário")
end

When('Eu seleciono a opção {string}') do |opcao|
  select opcao, from: "Público-alvo"
  puts "Opção selecionada: #{opcao}"
end

When('Eu preencho as informações do formulário') do
  fill_in "Título", with: "Avaliação de Desempenho"
  fill_in "Descrição", with: "Formulário de avaliação semestral"
  click_button "Adicionar Pergunta"
  fill_in "Questão 1", with: "Como você avalia a disciplina?"
  select "Múltipla escolha", from: "Tipo de resposta"
  fill_in "Opção 1", with: "Ótimo"
  fill_in "Opção 2", with: "Bom"
  click_button "Salvar"
end

When('Eu associo o formulário a uma turma específica') do
  select @turma.nome, from: "Turma"
end

When('Eu salvo o formulário') do
  click_button "Salvar"
end

Then('O formulário deve ser criado e associado aos {string} da turma selecionada') do |publico_alvo|
  expect(Formulario.last.turma).to eq(@turma)
  expect(Formulario.last.publico_alvo).to eq(publico_alvo)
end

Then('Deve exibir uma mensagem {string}') do |mensagem|
  expect(page).to have_content(mensagem)
end
