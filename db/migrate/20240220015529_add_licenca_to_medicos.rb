class AddLicencaToMedicos < ActiveRecord::Migration[7.0]
  def change
    add_column :medicos, :licenca, :string
  end
end
