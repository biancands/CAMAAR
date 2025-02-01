# language: pt
Funcionalidade: Importação de dados do SIGAA
  Como administrador do sistema
  Quero importar dados do SIGAA
  Para manter os dados acadêmicos atualizados

  Cenário: Importação bem-sucedida com dados válidos
    Dado que existem arquivos JSON válidos do SIGAA
    Quando executo a task de importação
    Então o sistema deve ter:
      | Modelo       | Quantidade |
      | Disciplina   | 2          |
      | Turma        | 3          |
      | Usuario      | 6          |
      | Sigaa        | 1          |
    E as associações entre turmas e usuários devem existir