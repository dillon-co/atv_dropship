class AddShippingMethodOrders < ActiveRecord::Migration[5.0]
  def change
    add_column :orders, :shipping_method, :integer
  end
end
