class ChangeProntuarioIdInConsultas < ActiveRecord::Migration[7.0]
  def change
    change_column_null :consultas, :prontuario_id, true
  end
end
