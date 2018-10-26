class AddColorToOrderItem < ActiveRecord::Migration[5.0]
  def change
    add_column :order_items, :color, :string
  end
end
