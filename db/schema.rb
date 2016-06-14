# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20160613181212) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "chamados", force: :cascade do |t|
    t.integer  "problema_id"
    t.text     "observacoes_usuario"
    t.integer  "user_id"
    t.string   "status"
    t.datetime "data_status_aberto"
    t.datetime "data_status_fechado"
    t.datetime "data_status_em_atendimento"
    t.datetime "data_status_concluido"
    t.text     "parecer_preliminar_tecnico"
    t.text     "parecer_final_tecnico"
    t.text     "motivo_cancelamento"
    t.text     "avaliacao_usuario"
    t.integer  "nivel_satisfacao_usuario"
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
    t.datetime "data_status_cancelado"
    t.integer  "tecnico_id"
  end

  create_table "departamentos", force: :cascade do |t|
    t.string   "nome"
    t.string   "sigla"
    t.string   "email"
    t.string   "telefone"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "incidentes", force: :cascade do |t|
    t.text     "descricao"
    t.datetime "data_inicio"
    t.datetime "data_fim"
    t.datetime "previsao_fim"
    t.text     "status"
    t.text     "observacoes"
    t.integer  "tipo_incidente_id"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
  end

  create_table "inventarios", force: :cascade do |t|
    t.integer  "departamento_id"
    t.integer  "quantidade"
    t.string   "estado"
    t.text     "observacoes"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  create_table "items", force: :cascade do |t|
    t.string   "nome"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "itens", force: :cascade do |t|
    t.string   "nome"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "problemas", force: :cascade do |t|
    t.text     "descricao"
    t.text     "solucao"
    t.string   "tipo"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "roles", force: :cascade do |t|
    t.string   "nome"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "roles_users", id: false, force: :cascade do |t|
    t.integer "user_id", null: false
    t.integer "role_id", null: false
  end

  add_index "roles_users", ["role_id", "user_id"], name: "index_roles_users_on_role_id_and_user_id", using: :btree
  add_index "roles_users", ["user_id", "role_id"], name: "index_roles_users_on_user_id_and_role_id", using: :btree

  create_table "tipo_incidentes", force: :cascade do |t|
    t.string   "descricao"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "",   null: false
    t.string   "encrypted_password",     default: "",   null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,    null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at",                            null: false
    t.datetime "updated_at",                            null: false
    t.string   "name"
    t.boolean  "ativo",                  default: true
    t.boolean  "mudar_senha",            default: true
    t.integer  "departamento_id"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

end
