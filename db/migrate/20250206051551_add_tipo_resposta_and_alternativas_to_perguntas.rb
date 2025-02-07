class AddTipoRespostaAndAlternativasToPerguntas < ActiveRecord::Migration[8.0]
  def up
    execute <<-SQL
      CREATE TYPE tipo_resposta_enum AS ENUM ('objetiva', 'multipla escolha', 'texto');
    SQL

    change_column :perguntas, :tipo_resposta, :tipo_resposta_enum, null: false, default: 'Texto'
    add_column :perguntas, :alternativas, :text, array: true, default: []
  end

  def down
    change_column :perguntas, :tipo_resposta, :text
  end
end

class AddTipoRespostaAndAlternativasToPerguntas < ActiveRecord::Migration[8.0]
  def up
    execute <<-SQL
      CREATE TYPE tipo_resposta_enum AS ENUM ('objetiva', 'multipla escolha', 'texto');
    SQL

    add_column :perguntas, :tipo_resposta_temp, :tipo_resposta_enum, null: false, default: 'texto'

    execute <<-SQL
      UPDATE perguntas SET tipo_resposta_temp = tipo_resposta::tipo_resposta_enum
    SQL

    remove_column :perguntas, :tipo_resposta

    rename_column :perguntas, :tipo_resposta_temp, :tipo_resposta

    add_column :perguntas, :alternativas, :text, array: true, default: []
  end

  def down
    add_column :perguntas, :tipo_resposta_temp, :text

    execute <<-SQL
      UPDATE perguntas SET tipo_resposta_temp = tipo_resposta::text
    SQL

    remove_column :perguntas, :tipo_resposta

    rename_column :perguntas, :tipo_resposta_temp, :tipo_resposta

    remove_column :perguntas, :alternativas

    execute <<-SQL
      DROP TYPE tipo_resposta_enum;
    SQL
  end
end