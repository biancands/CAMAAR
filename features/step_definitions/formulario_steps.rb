Given('Eu sou um usuário autenticado') do
  @usuario = Usuario.create!(nome: "Aluno", email: "aluno@email.com", password: "senha123")
  login_as(@usuario, scope: :usuario)
end

Given('Eu estou matriculado em turmas com formulários pendentes') do
  @turma = Turma.create!(nome: "Matemática", codigo: "M101")
  @usuario.turmas << @turma
  @formulario = Formulario.create!(titulo: "Avaliação Matemática", turmas: [ @turma ])
end

When('Eu acesso a página de formulários pendentes') do
  visit formularios_pendentes_path
end

Then('Eu devo ver a lista de formulários não respondidos') do
  expect(page).to have_content(@formulario.titulo)
end

Given('Eu estou matriculado em turmas sem formulários pendentes') do
  @turma = Turma.create!(nome: "História", codigo: "H101")
  @usuario.turmas << @turma
end

Then('Deve exibir uma mensagem {string}') do |mensagem|
  expect(page).to have_content(mensagem)
end
