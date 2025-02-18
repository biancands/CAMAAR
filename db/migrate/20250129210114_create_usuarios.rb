# db/migrate/XXXXXXXXXXXXXX_create_usuarios.rb
# Cria a tabela 'usuarios' com as colunas 'nome', 'email', 'password_digest', 'tipo' e 'matricula'.
# Adiciona índices únicos para as colunas 'email' e 'matricula'.
#
# Tabela: usuarios
# - nome: string, não nulo
# - email: string, não nulo
# - password_digest: string, não nulo
# - tipo: string, não nulo
# - matricula: string
# - created_at: datetime, gerado automaticamente pelo Rails
# - updated_at: datetime, gerado automaticamente pelo Rails
#
# Índices:
# - email: único
# - matricula: único
class CreateUsuarios < ActiveRecord::Migration[6.0]
  def change
    create_table :usuarios do |t|
      t.string :nome, null: false
      t.string :email, null: false
      t.string :password_digest, null: false
      t.string :tipo, null: false
      t.string :matricula

      t.timestamps
    end

    add_index :usuarios, :email, unique: true
    add_index :usuarios, :matricula, unique: true
  end
end
