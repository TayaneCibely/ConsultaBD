class ChangeColumnType < ActiveRecord::Migration[7.0]
  def change
    change_column :prontuarios, :datacriacao, :date
  end
end
