class ChangeDescricaoTypeInFormularios < ActiveRecord::Migration[8.0]
  def change
    def up
      change_column :formularios, :descricao, :string, limit: 140, null: true
    end
  
    def down
      change_column :formularios, :descricao, :string
    end
  end
end
