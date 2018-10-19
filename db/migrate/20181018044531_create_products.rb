class CreateProducts < ActiveRecord::Migration[5.0]
  def change
    create_table :products do |t|
      t.string :name
      t.integer :price, :default=>0
      t.boolean :tax_exempt, :default=>false
      t.boolean :active, :default=>true
      t.timestamps
    end
  end
end
