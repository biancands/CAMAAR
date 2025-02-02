class AddDepartamentoAndFormacaoToUsuario < ActiveRecord::Migration[8.0]
  def change
    add_column :usuarios, :departamento, :string
    add_column :usuarios, :formacao, :string
  end
end
