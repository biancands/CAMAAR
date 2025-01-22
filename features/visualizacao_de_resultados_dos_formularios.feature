Feature: Visualização de resultados dos formulários

  Como administrador, quero visualizar os formulários criados para poder gerar um relatório a partir das respostas.

  Scenario: Cenário Feliz - Exibir formulários criados
    Given Eu sou um administrador autenticado
    And Existem formulários criados no sistema
    When Eu acesso a página de gerenciamento de formulários
    Then Eu devo ver a lista de formulários criados
    And Cada formulário deve exibir o título, a descrição, a data de criação e o número de respostas recebidas

  Scenario: Cenário Triste - Nenhum formulário criado
    Given Eu sou um administrador autenticado
    And Não existem formulários criados no sistema
    When Eu acesso a página de gerenciamento de formulários
    Then Deve exibir uma mensagem "Nenhum formulário encontrado"
