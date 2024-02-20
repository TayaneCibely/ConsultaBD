class CreateExames < ActiveRecord::Migration[7.0]
  def change
    create_table :exames do |t|
      t.integer :cod
      t.date :data
      t.string :nomeExame
      t.text :descricao
      t.string :resultado

      t.references :prontuario, null: false, foreign_key: true
      t.references :consulta, null: false, foreign_key: true

      t.timestamps
    end
  end
end
