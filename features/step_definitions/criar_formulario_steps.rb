Given('existe um template {string}') do |template_nome|
  @template = Template.create!(nome: template_nome, usuario: @administrador_autenticado)
end

Given('existem as turmas {string} e {string}') do |turma1, turma2|
  @turma1 = Turma.create!(nome: turma1, codigo: "101")
  @turma2 = Turma.create!(nome: turma2, codigo: "102")
end

When('o Administrador {string} cria um formulário baseado no template {string}') do |nome, template_nome|
  @formulario = Formulario.create!(
    titulo: "Avaliação #{template_nome}",
    template: Template.find_by(nome: template_nome),
    turmas: [ @turma1, @turma2 ],
    usuario: Usuario.find_by(nome: nome)
  )
end

Then('o formulário deve ser criado para as turmas {string} e {string}') do |turma1, turma2|
  expect(@formulario.turmas.map(&:nome)).to include(turma1, turma2)
end

Given('não existe nenhum template disponível') do
  Template.destroy_all
end

When('o Administrador {string} tenta criar um formulário') do |nome|
  @formulario = Formulario.new(titulo: "Teste", template: nil, usuario: Usuario.find_by(nome: nome))
end

Then('o sistema deve exibir a mensagem {string}') do |mensagem|
  expect(@formulario.valid?).to be_falsey
  expect(@formulario.errors[:template]).to include(mensagem)
end
