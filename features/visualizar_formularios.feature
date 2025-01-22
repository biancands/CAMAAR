Feature: Visualizar formulários para responder

  Como participante de uma turma, quero visualizar os formulários não respondidos para escolher quais responder.

  Scenario: Cenário Feliz - Exibir formulários não respondidos
    Given Eu sou um usuário autenticado
    And Eu estou matriculado em turmas com formulários pendentes
    When Eu acesso a página de formulários pendentes
    Then Eu devo ver a lista de formulários não respondidos

  Scenario: Cenário Triste - Nenhum formulário pendente
    Given Eu sou um usuário autenticado
    And Eu estou matriculado em turmas sem formulários pendentes
    When Eu acesso a página de formulários pendentes
    Then Deve exibir uma mensagem "Não há formulário pendente"
