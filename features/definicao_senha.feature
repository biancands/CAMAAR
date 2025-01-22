Feature: Sistema de definição de senha
  Como Usuário
  Quero definir uma senha para o meu usuário a partir do e-mail do sistema de solicitação de cadastro
  Para acessar o sistema.

  Scenario: Usuário define senha com sucesso
    Given que existe um usuário com email "usuario@email.com" sem senha definida
    When o usuário solicita a definição de senha e insere "senha123"
    Then a senha do usuário deve ser definida como "senha123"
    And o usuário deve receber a mensagem "Senha definida com sucesso"

  Scenario: Usuário tenta definir uma senha fraca
    Given que existe um usuário com email "usuario@email.com" sem senha definida
    When o usuário solicita a definição de senha e insere "123"
    Then o sistema deve exibir a mensagem "Senha fraca: A senha deve ter no mínimo 6 caracteres"
    And a senha do usuário não deve ser salva