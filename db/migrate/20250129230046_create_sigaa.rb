class CreateSigaa < ActiveRecord::Migration[8.0]
  def change
    create_table :sigaas do |t|
      t.datetime :ultima_atualizacao, default: -> { 'CURRENT_TIMESTAMP' }
      t.string :tipo_dado
      t.jsonb :detalhes

      t.timestamps
    end
  end
end