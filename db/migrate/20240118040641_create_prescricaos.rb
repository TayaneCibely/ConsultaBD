class CreatePrescricaos < ActiveRecord::Migration[7.0]
  def change
    create_table :prescricaos do |t|
      t.string :cod
      t.date :data
      t.string :dosagem
      t.text :observacoes
      t.text :listaMedicamentos

      t.timestamps
    end
  end
end
