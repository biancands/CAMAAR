Feature: Criação de formulário para docentes ou dicentes

  Como administrador, quero escolher criar um formulário para os docentes ou discentes de uma turma, a fim de avaliar o desempenho de uma matéria.

  Scenario: Cenário Feliz - Criar formulário para os discentes de uma turma
    Given Eu sou um administrador autenticado
    And Existe pelo menos uma turma cadastrada no sistema
    When Eu acesso a página de criação de formulários
    And Eu seleciono a opção "Discentes"
    And Eu preencho as informações do formulário (título, descrição, perguntas)
    And Eu associo o formulário a uma turma específica
    And Eu salvo o formulário
    Then O formulário deve ser criado e associado aos discentes da turma selecionada

  Scenario: Cenário Feliz - Criar formulário para os docentes de uma turma
    Given Eu sou um administrador autenticado
    And Existe pelo menos uma turma cadastrada no sistema
    When Eu acesso a página de criação de formulários
    And Eu seleciono a opção "Docentes"
    And Eu preencho as informações do formulário (título, descrição, perguntas)
    And Eu associo o formulário a uma turma específica
    And Eu salvo o formulário
    Then O formulário deve ser criado e associado aos docentes da turma selecionada

  Scenario: Cenário Triste - Criar formulário sem selecionar docentes ou discentes
    Given Eu sou um administrador autenticado
    And Existe pelo menos uma turma cadastrada no sistema
    When Eu acesso a página de criação de formulários
    And Eu não seleciono "Discentes" nem "Docentes"
    And Eu tento salvar o formulário
    Then Deve exibir uma mensagem de erro "Você deve selecionar para quem o formulário será direcionado"
    And O formulário não deve ser criado

  Scenario: Cenário Triste - Criar formulário sem preencher as informações obrigatórias
    Given Eu sou um administrador autenticado
    And Existe pelo menos uma turma cadastrada no sistema
    When Eu acesso a página de criação de formulários
    And Eu seleciono a opção "Discentes"
    And Eu deixo o título ou as perguntas do formulário em branco
    And Eu tento salvar o formulário
    Then Deve exibir uma mensagem de erro "Todos os campos obrigatórios devem ser preenchidos"
    And O formulário não deve ser criado
