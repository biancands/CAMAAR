# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[8.0].define(version: 2025_02_02_050336) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "pg_catalog.plpgsql"

  create_table "disciplinas", force: :cascade do |t|
    t.string "codigo", null: false
    t.string "nome", null: false
    t.text "descricao"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["codigo"], name: "index_disciplinas_on_codigo", unique: true
  end

  create_table "formularios", force: :cascade do |t|
    t.string "titulo", null: false
    t.text "descricao"
    t.datetime "data_criacao", precision: nil, default: -> { "CURRENT_TIMESTAMP" }
    t.bigint "usuario_id"
    t.bigint "turma_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["turma_id"], name: "index_formularios_on_turma_id"
    t.index ["usuario_id"], name: "index_formularios_on_usuario_id"
  end

  create_table "perguntas", force: :cascade do |t|
    t.text "texto", null: false
    t.string "tipo_resposta", null: false
    t.bigint "formulario_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["formulario_id"], name: "index_perguntas_on_formulario_id"
  end

  create_table "respostas", force: :cascade do |t|
    t.text "conteudo", null: false
    t.datetime "data_resposta", precision: nil, default: -> { "CURRENT_TIMESTAMP" }
    t.bigint "usuario_id"
    t.bigint "pergunta_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["pergunta_id"], name: "index_respostas_on_pergunta_id"
    t.index ["usuario_id"], name: "index_respostas_on_usuario_id"
  end

  create_table "sigaa", force: :cascade do |t|
    t.datetime "ultima_atualizacao", precision: nil, default: -> { "CURRENT_TIMESTAMP" }
    t.string "tipo_dado"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "sigaas", force: :cascade do |t|
    t.datetime "ultima_atualizacao", default: -> { "CURRENT_TIMESTAMP" }
    t.string "tipo_dado"
    t.jsonb "detalhes"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "turmas", force: :cascade do |t|
    t.string "codigo", null: false
    t.string "nome"
    t.string "periodo"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "disciplina_id"
    t.string "horario"
    t.index ["codigo"], name: "index_turmas_on_codigo", unique: true
    t.index ["disciplina_id"], name: "index_turmas_on_disciplina_id"
  end

  create_table "turmas_usuarios", id: false, force: :cascade do |t|
    t.bigint "turma_id", null: false
    t.bigint "usuario_id", null: false
    t.index ["turma_id", "usuario_id"], name: "index_turmas_usuarios_on_turma_id_and_usuario_id"
    t.index ["usuario_id", "turma_id"], name: "index_turmas_usuarios_on_usuario_id_and_turma_id"
  end

  create_table "usuarios", force: :cascade do |t|
    t.string "nome", null: false
    t.string "email", null: false
    t.string "password_digest"
    t.string "tipo", null: false
    t.string "matricula"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "curso"
    t.string "departamento"
    t.string "formacao"
    t.string "activation_token"
    t.datetime "activation_token_sent_at", precision: nil
    t.index ["activation_token"], name: "index_usuarios_on_activation_token", unique: true
    t.index ["matricula"], name: "index_usuarios_on_matricula", unique: true
  end

  add_foreign_key "formularios", "turmas"
  add_foreign_key "formularios", "usuarios"
  add_foreign_key "perguntas", "formularios"
  add_foreign_key "respostas", "perguntas"
  add_foreign_key "respostas", "usuarios"
  add_foreign_key "turmas", "disciplinas"
end
