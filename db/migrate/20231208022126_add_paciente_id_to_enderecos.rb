class AddPacienteIdToEnderecos < ActiveRecord::Migration[7.0]
  def change
    add_column :enderecos, :paciente_id, :integer
  end
end
