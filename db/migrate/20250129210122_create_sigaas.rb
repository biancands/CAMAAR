class CreateSigaas < ActiveRecord::Migration[8.0]
  def change
    create_table :sigaas do |t|
      t.string :tipo_dado
      t.datetime :ultima_atualizacao
      t.jsonb :detalhes

      t.timestamps
    end
  end
end