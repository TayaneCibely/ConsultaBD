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

ActiveRecord::Schema[7.0].define(version: 2024_02_20_104221) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "adminpack"
  enable_extension "plpgsql"

  create_table "consultas", force: :cascade do |t|
    t.date "data"
    t.time "horario"
    t.text "descricao"
    t.bigint "paciente_id", null: false
    t.bigint "medico_id", null: false
    t.bigint "prontuario_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["medico_id"], name: "index_consultas_on_medico_id"
    t.index ["paciente_id", "data", "horario"], name: "index_consultas_on_paciente_id_and_data_and_horario", unique: true
    t.index ["paciente_id"], name: "index_consultas_on_paciente_id"
    t.index ["prontuario_id"], name: "index_consultas_on_prontuario_id"
  end

  create_table "enderecos", force: :cascade do |t|
    t.integer "cep"
    t.string "cidade"
    t.string "bairro"
    t.integer "numero"
    t.string "logradouro"
    t.string "complemento"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "exames", force: :cascade do |t|
    t.integer "cod"
    t.date "data"
    t.string "nomeExame"
    t.text "descricao"
    t.string "resultado"
    t.bigint "prontuario_id", null: false
    t.bigint "consultas_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["consultas_id"], name: "index_exames_on_consultas_id"
    t.index ["prontuario_id"], name: "index_exames_on_prontuario_id"
  end

  create_table "medicos", force: :cascade do |t|
    t.string "nome"
    t.string "lincenca"
    t.string "especialidade"
    t.string "cpf"
    t.string "email"
    t.bigint "user_id"
    t.bigint "endereco_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "licenca"
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.index ["cpf"], name: "index_medicos_on_cpf"
    t.index ["cpf"], name: "medicos_cpf_key", unique: true
    t.index ["email"], name: "index_medicos_on_email"
    t.index ["endereco_id"], name: "index_medicos_on_endereco_id"
    t.index ["lincenca"], name: "index_medicos_on_lincenca"
    t.index ["reset_password_token"], name: "index_medicos_on_reset_password_token", unique: true
    t.index ["user_id"], name: "index_medicos_on_user_id"
  end

  create_table "pacientes", force: :cascade do |t|
    t.string "nome_completo"
    t.date "data_nascimento"
    t.string "cpf"
    t.string "email", limit: 100
    t.string "telefone"
    t.bigint "user_id"
    t.bigint "endereco_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.index ["cpf"], name: "index_pacientes_on_cpf", unique: true
    t.index ["cpf"], name: "pacientes_cpf_key", unique: true
    t.index ["email"], name: "index_pacientes_on_email", unique: true
    t.index ["endereco_id"], name: "index_pacientes_on_endereco_id"
    t.index ["reset_password_token"], name: "index_pacientes_on_reset_password_token", unique: true
    t.index ["user_id"], name: "index_pacientes_on_user_id"
  end

  create_table "prescricoes", force: :cascade do |t|
    t.integer "cod"
    t.date "data"
    t.text "observacoes"
    t.string "dosagem"
    t.text "listaMedicamentos"
    t.bigint "prontuario_id", null: false
    t.bigint "consultas_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["consultas_id"], name: "index_prescricoes_on_consultas_id"
    t.index ["prontuario_id"], name: "index_prescricoes_on_prontuario_id"
  end

  create_table "prontuarios", force: :cascade do |t|
    t.integer "codigo"
    t.datetime "datacriaco"
    t.text "historico"
    t.bigint "paciente_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["paciente_id"], name: "index_prontuarios_on_paciente_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "user_type"
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "consultas", "medicos"
  add_foreign_key "consultas", "pacientes"
  add_foreign_key "consultas", "prontuarios"
  add_foreign_key "exames", "consultas", column: "consultas_id"
  add_foreign_key "exames", "prontuarios"
  add_foreign_key "medicos", "enderecos"
  add_foreign_key "medicos", "users"
  add_foreign_key "pacientes", "enderecos"
  add_foreign_key "pacientes", "users"
  add_foreign_key "prescricoes", "consultas", column: "consultas_id"
  add_foreign_key "prescricoes", "prontuarios"
  add_foreign_key "prontuarios", "pacientes"
end
