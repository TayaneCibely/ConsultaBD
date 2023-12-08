class CreateConsultas < ActiveRecord::Migration[7.0]
  def change
    create_table :consulta do |t|
      t.date :data
      t.time :horario
      t.references :medicos, null: false, foreign_key: true
      t.references :pacientes, { null: false, foreign_keys: true }
      t.timestamps
    end
  end
end
