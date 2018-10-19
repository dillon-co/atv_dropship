class AddDescriptionToInventories < ActiveRecord::Migration[5.0]
  def change
    add_column :inventories, :description, :text
  end
end
