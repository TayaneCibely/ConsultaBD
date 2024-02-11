class AddNumeroToEnderecos < ActiveRecord::Migration[7.0]
  def change
    add_column :enderecos, :numero, :string
  end
end
