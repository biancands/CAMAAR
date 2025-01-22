Feature: Criar template de formulário
  Como Administrador
  Quero criar um template de formulário contendo as questões do formulário
  Para gerar formulários de avaliações para avaliar o desempenho das turmas.

  Scenario: Administrador cria template com sucesso
    Given que existe um Administrador "João"
    When o Administrador cria um template chamado "Avaliação Final" com questões
    Then o template deve ser salvo no sistema
    And o sistema deve exibir a mensagem "Template criado com sucesso"

  Scenario: Administrador tenta criar template sem questões
    Given que existe um Administrador "João"
    When o Administrador tenta criar um template chamado "Avaliação Final" sem adicionar questões
    Then o sistema deve exibir a mensagem "Erro: O template deve conter ao menos uma questão"