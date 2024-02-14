class CreateConsultas < ActiveRecord::Migration[7.0]
  def change
    create_table :consultas do |t|
      t.date :data
      t.time :horario
      t.text :descricao

      t.references :paciente, null: false, foreign_key: true
      t.references :medico, null: false, foreign_key: true
      t.references :prontuario, null:false, foreign_key: true

      t.timestamps
    end
    add_index :consultas, [:paciente_id, :data, :horario], unique: true
  end
end
