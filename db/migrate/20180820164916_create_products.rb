class CreateProducts < ActiveRecord::Migration[5.0]
  def change
    create_table :products do |t|
      t.references :vehicle, foreign_key: true
      t.string :title
      t.string :description
      t.float :price
      t.integer :type
      t.string :image

      t.timestamps
    end
  end
end
