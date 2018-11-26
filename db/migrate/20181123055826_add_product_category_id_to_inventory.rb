class AddProductCategoryIdToInventory < ActiveRecord::Migration[5.0]
  def change
    add_column :inventories, :product_category_id, :integer
    add_index :inventories, :product_category_id
  end
end
