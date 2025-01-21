Feature: Edição e exclusão de modelos

  Como administrador, quero editar e/ou deletar um template que eu criei sem afetar os formulários já criados, a fim de organizar os templates existentes.

  Scenario: Cenário Feliz - Editar um template criado
    Given Eu sou um administrador autenticado
    And Existe um template criado por mim
    When Eu acesso a página de gerenciamento de templates
    And Eu seleciono a opção de editar um template
    And Eu altero as informações do template (nome ou descrição)
    And Eu salvo as alterações
    Then O template deve ser atualizado com as novas informações
    And Os formulários já criados a partir deste template devem permanecer inalterados

  Scenario: Cenário Feliz - Deletar um template criado
    Given Eu sou um administrador autenticado
    And Existe um template criado por mim
    When Eu acesso a página de gerenciamento de templates
    And Eu seleciono a opção de deletar um template
    And Eu confirmo a exclusão
    Then O template deve ser removido do sistema
    And Os formulários já criados a partir deste template devem permanecer inalterados

  Scenario: Cenário Triste - Tentar editar ou deletar um template que não criei
    Given Eu sou um administrador autenticado
    And Existe um template criado por outro administrador
    When Eu tento editar ou deletar o template
    Then Deve exibir uma mensagem de erro "Você não tem permissão para gerenciar este template"

  Scenario: Cenário Triste - Tentar deletar um template vinculado a formulários existentes
    Given Eu sou um administrador autenticado
    And Existe um template criado por mim vinculado a formulários existentes
    When Eu tento deletar o template
    Then Deve exibir uma mensagem de erro "Não é possível deletar este template porque ele está vinculado a formulários existentes"
    And O template deve permanecer no sistema
