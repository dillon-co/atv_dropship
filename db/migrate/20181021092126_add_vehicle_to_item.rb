class AddVehicleToItem < ActiveRecord::Migration[5.0]
  def change
    add_column :order_items, :vehicle_type, :string
    add_column :order_items, :vehicle_year, :integer
    add_column :order_items, :vehicle_make, :string
    add_column :order_items, :vehicle_model, :string
  end
end
