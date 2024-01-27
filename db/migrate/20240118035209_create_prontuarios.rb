class CreateProntuarios < ActiveRecord::Migration[7.0]
  def change
    create_table :prontuarios do |t|
      t.date :dataCriacao
      t.string :codigo
      t.text :historico

      t.timestamps
    end
  end
end
