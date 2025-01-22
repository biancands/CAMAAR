Feature: Visualização dos templates criados

  Como administrador, quero visualizar os templates criados para poder editá-los ou deletá-los.

  Scenario: Cenário Feliz - Exibir templates criados
    Given Eu sou um administrador autenticado
    And Existem templates criados no sistema
    When Eu acesso a página de gerenciamento de templates
    Then Eu devo ver a lista de templates criados
    And Cada template deve exibir o nome, a descrição e a data de criação
    And Deve haver opções para editar e deletar cada template

  Scenario: Cenário Triste - Nenhum template criado
    Given Eu sou um administrador autenticado
    And Não existem templates criados no sistema
    When Eu acesso a página de gerenciamento de templates
    Then Deve exibir uma mensagem "Nenhum template encontrado"

  Scenario: Cenário Triste - Tentativa de deletar um template que não é meu
    Given Eu sou um administrador autenticado
    And Existem templates criados por outros usuários no sistema
    When Eu tento deletar um template que não criei
    Then Deve exibir uma mensagem de erro "Você não tem permissão para deletar este template"
