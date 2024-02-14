class CreateMedicos < ActiveRecord::Migration[7.0]
  def change
    create_table :medicos do |t|

      t.string :nome
      t.string :lincenca
      t.string :especialidade
      t.string :cpf
      t.string :email

      t.references :user, foreign_key: true

      t.timestamps
    end
    add_index :medicos, :cpf
    add_index :medicos, :email
    add_index :medicos, :lincenca
  end
end
