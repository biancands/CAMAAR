Feature: Responder formulário
  Como Participante de uma turma
  Quero responder o questionário sobre a turma em que estou matriculado
  A fim de submeter minha avaliação da turma.

  Scenario: Cenário Feliz - Responder formulário com sucesso
    Given que o participante está matriculado em uma turma
    And um formulário válido está disponível
    When o participante preenche o formulário corretamente
    And submete o formulário
    Then o sistema salva as respostas
    And exibe uma mensagem de confirmação

  Scenario: Cenário Triste - Formulário incompleto ou inválido
    Given que o participante está matriculado em uma turma
    And um formulário está disponível
    When o participante tenta submeter o formulário com dados incompletos ou inválidos
    Then o sistema rejeita o envio
    And exibe uma mensagem de erro informando os campos pendentes ou inválidos