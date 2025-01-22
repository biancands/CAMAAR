Feature: Importar dados do SIGAA
  Como Administrador
  Quero importar dados de turmas, matérias e participantes do SIGAA a partir de arquivos JSON
  A fim de alimentar a base de dados do sistema.

  Scenario: Cenário Feliz - Importar dados com sucesso
    Given que os dados do SIGAA estão disponíveis no formato JSON
    And os arquivos não possuem dados duplicados
    When eu importo os dados do SIGAA
    Then os dados de turmas, matérias e participantes são salvos na base de dados
    And nenhuma duplicação ocorre

  Scenario: Cenário Triste - Dados inválidos ou duplicados
    Given que os dados do SIGAA estão disponíveis no formato JSON
    And os arquivos possuem dados inválidos ou duplicados
    When eu tento importar os dados do SIGAA
    Then o sistema rejeita os dados inválidos
    And exibe uma mensagem de erro apropriada