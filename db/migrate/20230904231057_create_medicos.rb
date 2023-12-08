class CreateMedicos < ActiveRecord::Migration[7.0]
  def change
    create_table :medicos do |t|
      t.string :nome
      t.string :crm
      t.string :uf_crm
      t.string :especialidade
      t.string :cpf
      t.string :email
      t.time :inicio_consulta
      t.time :termino_consulta

      t.timestamps
    end
  end
end
