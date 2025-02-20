Given('que o participante está matriculado em uma turma') do
  @turma = Turma.create!(codigo: "123", nome: "Turma A", periodo: "2023.1")
  @participante = Usuario.create!(nome: "Aluno", email: "aluno@example.com", tipo: "Discente", password: "senha123")
  @turma.usuarios << @participante
end

Given('um formulário válido está disponível') do
  @formulario = Formulario.create!(titulo: "Avaliação da Disciplina", turma: @turma)
end

When('o participante preenche o formulário corretamente') do
  visit responder_formulario_path(@formulario)
  choose "Ótimo"
  click_button "Enviar"
end

Then('o sistema salva as respostas') do
  expect(Resposta.count).to be > 0
end

Then('exibe uma mensagem de confirmação') do
  expect(page).to have_content("Respostas enviadas com sucesso")
end
