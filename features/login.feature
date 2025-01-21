Feature: Sistema de login
  Como Usuário do sistema
  Quero acessar o sistema utilizando um e-mail ou matrícula e uma senha já cadastrada
  Para responder formulários ou gerenciar o sistema.

  Scenario: Login com sucesso
    Given que existe um usuário com email "usuario@email.com" e senha "senha123"
    When o usuário tenta logar com email "usuario@email.com" e senha "senha123"
    Then o login deve ser realizado com sucesso
    And o usuário deve ser redirecionado para a página inicial

  Scenario: Login com erro de senha
    Given que existe um usuário com email "usuario@email.com" e senha "senha123"
    When o usuário tenta logar com email "usuario@email.com" e senha "senhaErrada"
    Then uma mensagem de erro "Senha inválida" deve ser exibida