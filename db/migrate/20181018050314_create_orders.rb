class CreateOrders < ActiveRecord::Migration[5.0]
  def change
    create_table :orders do |t|
      t.string  :user_name
      t.string  :prodno
      t.string  :street_address
      t.string  :city
      t.string  :state
      t.string  :zip
      t.decimal :subtotal, precision: 12, scale: 3
      t.decimal :tax, precision: 12, scale: 3
      t.decimal :shipping, precision: 12, scale: 3
      t.decimal :total, precision: 12, scale: 3
      # t.references :order_status, foreign_key: true

      t.timestamps
    end
  end
end
