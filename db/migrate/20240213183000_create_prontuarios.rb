class CreateProntuarios < ActiveRecord::Migration[7.0]
  def change
    create_table :prontuarios do |t|
      t.integer :codigo
      t.datetime :datacriacao
      t.text :historico
      t.references :paciente, null: false, foreign_key: true

      t.timestamps
    end
  end
end
