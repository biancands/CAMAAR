Given('Eu sou um administrador autenticado') do
    @administrador_autenticado = true
    puts "Administrador autenticado: #{@administrador_autenticado}"
    pending
  end
  
  Given('Existe pelo menos uma turma cadastrada no sistema') do
    @turmas = [{ id: 1, nome: 'Turma A' }]
    puts "Turmas cadastradas: #{@turmas.map { |t| t[:nome] }.join(', ')}"
    pending
  end
  
  When('Eu acesso a página de criação de formulários') do
    @pagina_acessada = 'criação de formulários'
    puts "Página acessada: #{@pagina_acessada}"
    pending
  end
  
  When('Eu seleciono a opção {string}') do |opcao|
    @opcao_selecionada = opcao
    puts "Opção selecionada: #{@opcao_selecionada}"
    pending
  end
  
  When('Eu preencho as informações do formulário') do
    @formulario = { titulo: 'Avaliação de Desempenho', perguntas: ['Pergunta 1', 'Pergunta 2'] }
    puts "Formulário preenchido: #{@formulario[:titulo]}"
    pending
  end
  
  When('Eu associo o formulário a uma turma específica') do
    @formulario[:turma] = @turmas.first
    puts "Formulário associado à turma: #{@formulario[:turma][:nome]}"
    pending
  end
  
  When('Eu salvo o formulário') do
    if @opcao_selecionada.nil? || @formulario[:titulo].nil? || @formulario[:perguntas].empty?
      @formulario_salvo = false
      puts "Erro ao salvar o formulário: campos obrigatórios ausentes."
    else
      @formulario_salvo = true
      puts "Formulário salvo com sucesso."
    end
    pending
  end
  
  Then('O formulário deve ser criado e associado aos {string} da turma selecionada') do |publico_alvo|
    if @formulario_salvo && @opcao_selecionada == publico_alvo
      puts "Formulário criado com sucesso para os #{publico_alvo}."
    else
      puts "Falha ao criar o formulário."
    end
    pending
  end
  
  Then('Deve exibir uma mensagem {string}') do |mensagem|
    if @formulario_salvo
      puts "Mensagem de sucesso: #{mensagem}"
    else
      puts "Mensagem de erro: #{mensagem}"
    end
    pending
  end

Given('Eu solicito a atualização da base de dados com os dados do SIGAA') do
  pending
end

Given('Eu solicito a atualização da base de dados') do
  pending
end

When('O sistema acessa os dados do SIGAA') do
  pending
end

Then('A base de dados deve ser atualizada com sucesso') do
  pending
end

When('O sistema falha ao conectar ao SIGAA') do
  pending
end

Then('Deve exibir uma mensagem de erro {string}') do |mensagem|
  pending
end
