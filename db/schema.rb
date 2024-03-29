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

ActiveRecord::Schema[7.0].define(version: 2024_02_22_164928) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "adminpack"
  enable_extension "plpgsql"

  create_table "consultas", force: :cascade do |t|
    t.date "data"
    t.time "horario"
    t.text "descricao"
    t.bigint "paciente_id", null: false
    t.bigint "medico_id", null: false
    t.bigint "prontuario_id"
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
    t.bigint "consulta_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["consulta_id"], name: "index_exames_on_consulta_id"
    t.index ["prontuario_id"], name: "index_exames_on_prontuario_id"
  end

  create_table "medicos", force: :cascade do |t|
    t.string "nome"
    t.string "especialidade"
    t.string "cpf"
    t.string "email"
    t.bigint "endereco_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "licenca"
    t.index ["cpf"], name: "index_medicos_on_cpf"
    t.index ["cpf"], name: "medicos_cpf_key", unique: true
    t.index ["email"], name: "index_medicos_on_email"
    t.index ["endereco_id"], name: "index_medicos_on_endereco_id"
  end

  create_table "pacientes", force: :cascade do |t|
    t.string "nome_completo"
    t.date "data_nascimento"
    t.string "cpf"
    t.string "email", limit: 100
    t.string "telefone"
    t.bigint "endereco_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["cpf"], name: "index_pacientes_on_cpf", unique: true
    t.index ["cpf"], name: "pacientes_cpf_key", unique: true
    t.index ["email"], name: "index_pacientes_on_email", unique: true
    t.index ["endereco_id"], name: "index_pacientes_on_endereco_id"
  end

  create_table "prescricoes", force: :cascade do |t|
    t.integer "cod"
    t.date "data"
    t.text "observacoes"
    t.string "dosagem"
    t.text "listaMedicamentos"
    t.bigint "prontuario_id", null: false
    t.bigint "consulta_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["consulta_id"], name: "index_prescricoes_on_consultas_id"
    t.index ["prontuario_id"], name: "index_prescricoes_on_prontuario_id"
  end

  create_table "prontuarios", force: :cascade do |t|
    t.integer "codigo"
    t.date "datacriacao"
    t.text "historico"
    t.bigint "paciente_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["paciente_id"], name: "index_prontuarios_on_paciente_id"
  end

  add_foreign_key "consultas", "medicos"
  add_foreign_key "consultas", "pacientes"
  add_foreign_key "consultas", "prontuarios"
  add_foreign_key "exames", "consultas"
  add_foreign_key "exames", "prontuarios"
  add_foreign_key "medicos", "enderecos"
  add_foreign_key "pacientes", "enderecos"
  add_foreign_key "prescricoes", "consultas"
  add_foreign_key "prescricoes", "prontuarios"
  add_foreign_key "prontuarios", "pacientes"
end
