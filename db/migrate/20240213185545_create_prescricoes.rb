class CreatePrescricoes < ActiveRecord::Migration[7.0]
  def change
    create_table :prescricoes do |t|
      t.integer :cod
      t.date :data
      t.text :observacoes
      t.string :dosagem
      t.text :listaMedicamentos

      t.references :prontuario, null: false, foreign_key: true
      t.references :consultas, null: false, foreign_key: true

      t.timestamps
    end
  end
end
