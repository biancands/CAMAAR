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

2. Instale as dependências:
    ```sh
    bundle install
    ```

3. Crie o banco de dados:
    ```sh
    rails db:create
    ```

4. Execute as migrações do banco de dados:
    ```sh
    rails db:migrate
    ```

5. Importe os dados do SIGAA:
    ```sh
    rails db:import_sigaa_data
    ```

6. Importe os dados dos usuários:
    ```sh
    rails db:import_usuarios
    ```

7. Inicie o servidor:
    ```sh
    rails server
    ```

Agora você pode acessar o projeto em `http://localhost:3000`.
