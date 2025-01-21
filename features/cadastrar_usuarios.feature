Feature: Cadastrar usuários do sistema
  Como Administrador
  Quero cadastrar participantes de turmas do SIGAA ao importar dados de usuários novos para o sistema
  A fim de que eles acessem o sistema CAMAAR.

  Scenario: Cenário Feliz - Cadastro de usuários com sucesso
    Given que existem dados de participantes novos no SIGAA
    And esses dados estão disponíveis no formato JSON
    When eu importo os dados de participantes
    Then os participantes são cadastrados no sistema
    And recebem credenciais de acesso.

  Scenario: Cenário Triste - Dados incompletos ou duplicados
    Given que existem dados de participantes no SIGAA
    And esses dados estão disponíveis no formato JSON
    When eu tento importar dados de participantes com informações incompletas ou duplicadas
    Then o sistema rejeita os dados inválidos
    And exibe uma mensagem de erro apropriada
