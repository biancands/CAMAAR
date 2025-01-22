Feature: Gerar relatório do administrador
  Como Administrador
  Quero baixar um arquivo CSV contendo os resultados de um formulário
  Para avaliar o desempenho das turmas.

  Scenario: Administrador gera relatório com sucesso
    Given que existe um formulário "Avaliação Semestral" com respostas
    When o Administrador solicita o relatório do formulário "Avaliação Semestral"
    Then o sistema deve gerar um arquivo CSV com os resultados
    And o Administrador deve conseguir fazer o download do arquivo

  Scenario: Administrador tenta gerar relatório sem respostas
    Given que existe um formulário "Avaliação Semestral" sem respostas
    When o Administrador solicita o relatório do formulário "Avaliação Semestral"
    Then o sistema deve exibir a mensagem "Erro: Não há respostas para este formulário"