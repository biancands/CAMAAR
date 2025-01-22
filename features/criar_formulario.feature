Feature: Criar formulário de avaliação
  Como Administrador
  Quero criar um formulário baseado em um template para as turmas que eu escolher
  Para avaliar o desempenho das turmas no semestre atual.

  Scenario: Administrador cria formulário com sucesso
    Given que existe um Administrador "João"
    And existe um template "Avaliação Semestral"
    And existem as turmas "Álgebra 1" e "Cálculo 2"
    When o Administrador "João" cria um formulário baseado no template "Avaliação Semestral"
    Then o formulário deve ser criado para as turmas "Álgebra 1" e "Cálculo 2"
    And o sistema deve exibir a mensagem "Formulário criado com sucesso"

  Scenario: Administrador tenta criar formulário sem template
    Given que existe um Administrador "João"
    And não existe nenhum template disponível
    When o Administrador "João" tenta criar um formulário
    Then o sistema deve exibir a mensagem "Erro: Nenhum template disponível para criar o formulário"