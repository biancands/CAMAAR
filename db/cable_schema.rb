# Esquema do banco de dados para a tabela "solid_cable_messages"
#
# Esta tabela armazena mensagens de cabo sólido com os seguintes atributos:
#
# @!attribute [rw] channel
#   @return [binary] Canal da mensagem, com limite de 1024 bytes, não pode ser nulo.
#
# @!attribute [rw] payload
#   @return [binary] Conteúdo da mensagem, com limite de 536870912 bytes, não pode ser nulo.
#
# @!attribute [rw] created_at
#   @return [datetime] Data e hora de criação da mensagem, não pode ser nulo.
#
# @!attribute [rw] channel_hash
#   @return [integer] Hash do canal, com limite de 8 bytes, não pode ser nulo.
#
# Índices:
# - `index_solid_cable_messages_on_channel` no atributo `channel`
# - `index_solid_cable_messages_on_channel_hash` no atributo `channel_hash`
# - `index_solid_cable_messages_on_created_at` no atributo `created_at`
ActiveRecord::Schema[7.1].define(version: 1) do
  create_table "solid_cable_messages", force: :cascade do |t|
    t.binary "channel", limit: 1024, null: false
    t.binary "payload", limit: 536870912, null: false
    t.datetime "created_at", null: false
    t.integer "channel_hash", limit: 8, null: false
    t.index ["channel"], name: "index_solid_cable_messages_on_channel"
    t.index ["channel_hash"], name: "index_solid_cable_messages_on_channel_hash"
    t.index ["created_at"], name: "index_solid_cable_messages_on_created_at"
  end
end
