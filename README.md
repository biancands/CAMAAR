# CAMAAR
Sistema para avaliação de atividades acadêmicas remotas do CIC

## Como Rodar o Projeto na Máquina

### Configuração do Banco de Dados
1. Crie um banco de dados PostgreSQL.
2. Configure o arquivo `config/database.yml` com as credenciais do seu banco de dados.

### Passos para Executar o Projeto
1. Clone o repositório:
    ```sh
    git clone https://github.com/seu-usuario/CAMAAR.git
    cd CAMAAR
    ```
2. Defina a versão do ruby utilizada no projeto:
   ```sh
   rben install 3.2.6 rbenv local 3.2.6
   ```
3. Instale as dependências:
    ```sh
    bundle install
    ```
3. Configura o banco de dados:
   ```sh
   sudo -u postgres psql / CREATE ROLE camaar_user WITH LOGIN PASSWORD 'camaar_password1' / ALTER ROLE camaar_user CREATEDB \q
   ```
4. Crie o banco de dados:
    ```sh
    rails db:create
    ```

4. Execute as migrações do banco de dados:
    ```sh
    rails db:migrate
    ```

5. Importe os dados do admin:
    ```sh
    rails db:seed
    ```

7. Inicie o servidor:
    ```sh
    rails server
    ```
8. Cadastrar usuarios:
   ```sh
   Faça login usando usando os dados do admin, clica em Importar Dados. Com isso, os usuarios serão cadastrados, um token será enviado para o email de cada usuario e tambem será retornado no terminal. Copia o token do terminal e usa para finalizar o cadastro dos usuarios na tela de Cadastro.
   ```

9. Importar dados do SIGAA:
    ```sh
    rails db:import_sigaa_data
    ```
    
Agora você pode acessar o projeto em `http://localhost:3000`.

## Participantes:
1. Alan Henrique Rangel Ferreira - 190101270
2. Bianca Neves da Silva - 231013583
3. DANILO SILVEIRA DA SILVA - 222014142
4. Guilherme Ribeiro de Macedo - 170162354
5. Pedro José Monteiro de Barros Ceva Rodrigues - 190139315

### Scrum Master: Alan Henrique
### Product Owner: Bianca Neves

#### A política de branches se baseou na criação de novas branches a partir da branch sprint-1 para o desenvolvimento de cada feature. Após a conclusão do desenvolvimento, promovia-se um pull request para a branch sprint-2.

O trabalho foi desenvolvido utilizando o kanban. O que cada um desenvolveu está documentado nos cards e também nos commits. Link do quadro kanban utilizado:
```sh
https://github.com/users/biancands/projects/4
```
