Feature: Atualizar base de dados com SIGAA

  Como administrador, quero atualizar a base de dados com os dados do SIGAA para garantir que as informações estejam atualizadas.

  Scenario: Cenário Feliz - Atualização bem-sucedida
    Given Eu sou um administrador autenticado
    And Eu solicito a atualização da base de dados com os dados do SIGAA
    When O sistema acessa os dados do SIGAA
    Then A base de dados deve ser atualizada com sucesso

  Scenario: Cenário Triste - Erro na conexão com o SIGAA
    Given Eu sou um administrador autenticado
    When Eu solicito a atualização da base de dados
    And O sistema falha ao conectar ao SIGAA
    Then Deve exibir uma mensagem de erro "Falha na conexão com o SIGAA. Tente novamente mais tarde"
