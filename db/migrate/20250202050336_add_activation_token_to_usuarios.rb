class AddActivationTokenToUsuarios < ActiveRecord::Migration[6.0]
  def change
    add_column :usuarios, :activation_token, :string, unique: true
    add_column :usuarios, :activation_token_sent_at, :datetime
    add_index :usuarios, :activation_token, unique: true
  end
end
