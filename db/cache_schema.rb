# Este arquivo define o esquema do banco de dados para a tabela `solid_cache_entries`.
# 
# Versão do Schema: 7.2
# Versão da Tabela: 1
#
# Tabela: solid_cache_entries
# 
# Colunas:
# - key: Chave binária com limite de 1024 bytes, não nula.
# - value: Valor binário com limite de 536870912 bytes, não nulo.
# - created_at: Data e hora de criação, não nula.
# - key_hash: Hash da chave, inteiro com limite de 8 bytes, não nulo.
# - byte_size: Tamanho em bytes, inteiro com limite de 4 bytes, não nulo.
#
# Índices:
# - index_solid_cache_entries_on_byte_size: Índice na coluna `byte_size`.
# - index_solid_cache_entries_on_key_hash_and_byte_size: Índice nas colunas `key_hash` e `byte_size`.
# - index_solid_cache_entries_on_key_hash: Índice único na coluna `key_hash`.
# frozen_string_literal: true

ActiveRecord::Schema[7.2].define(version: 1) do
  create_table "solid_cache_entries", force: :cascade do |t|
    t.binary "key", limit: 1024, null: false
    t.binary "value", limit: 536870912, null: false
    t.datetime "created_at", null: false
    t.integer "key_hash", limit: 8, null: false
    t.integer "byte_size", limit: 4, null: false
    t.index ["byte_size"], name: "index_solid_cache_entries_on_byte_size"
    t.index ["key_hash", "byte_size"], name: "index_solid_cache_entries_on_key_hash_and_byte_size"
    t.index ["key_hash"], name: "index_solid_cache_entries_on_key_hash", unique: true
  end
end
