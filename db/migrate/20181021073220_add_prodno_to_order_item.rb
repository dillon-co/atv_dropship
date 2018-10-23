class AddProdnoToOrderItem < ActiveRecord::Migration[5.0]
  def change
    add_column :order_items, :prodno, :string
    add_column :order_items, :name, :string
    add_column :order_items, :size, :string
  end
end
