class AddCursoToUsuarios < ActiveRecord::Migration[8.0]
  def change
    add_column :usuarios, :curso, :string
  end
end
