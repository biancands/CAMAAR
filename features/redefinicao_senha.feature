Feature: Redefinição de senha

  Como usuário autenticado, quero redefinir minha senha por meio de um link enviado ao meu e-mail, para recuperar o acesso ao sistema.

  Scenario: Cenário Feliz - Redefinir senha com sucesso
    Given Eu solicitei a redefinição de senha para o e-mail "usuario@exemplo.com"
    And Eu recebo um e-mail com o link de redefinição
    When Eu acesso o link de redefinição
    And Eu insiro uma nova senha "NovaSenha123"
    Then Minha senha deve ser redefinida com sucesso

  Scenario: Cenário Triste - E-mail não registrado
    Given Eu solicitei a redefinição de senha para o e-mail "usuarioinvalido@exemplo.com"
    When O sistema verifica o e-mail
    Then Deve exibir uma mensagem de erro "E-mail não registrado no sistema"

  Scenario: Cenário Triste - Link expirado
    Given Eu recebo um e-mail com o link de redefinição
    When Eu acesso o link após o prazo de validade
    Then Deve exibir uma mensagem de erro "O link que você seguiu expirou"
