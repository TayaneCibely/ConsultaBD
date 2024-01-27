class CreateExames < ActiveRecord::Migration[7.0]
  def change
    create_table :exames do |t|
      t.string :cod
      t.date :data
      t.string :nomeExame
      t.text :descricao
      t.string :resultado

      t.timestamps
    end
  end
end
