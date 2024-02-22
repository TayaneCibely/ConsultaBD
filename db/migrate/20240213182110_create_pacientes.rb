class CreatePacientes < ActiveRecord::Migration[7.0]
  def change
    create_table :pacientes do |t|
      t.string :nome_completo
      t.date :data_nascimento
      t.string :cpf
      t.string :email, limit: 100
      t.string :telefone

      t.references :endereco, foreign_key: true

      t.timestamps
    end
    add_index :pacientes, :cpf, unique: true
    add_index :pacientes, :email, unique: true
  end
end
