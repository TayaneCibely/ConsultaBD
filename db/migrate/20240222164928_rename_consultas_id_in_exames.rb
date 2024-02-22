class RenameConsultasIdInExames < ActiveRecord::Migration[7.0]
  def change
    rename_column :exames, :consultas_id, :consulta_id
  end
end
