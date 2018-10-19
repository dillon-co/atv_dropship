class CreateInventories < ActiveRecord::Migration[5.0]
  def change
    create_table :inventories do |t|
      t.integer :prodno
      t.integer :upc, limit: 8
      t.string :mf_id
      t.float :msrp
      t.float :dealer_price
      t.string :name
      t.string :qty_ut
      t.integer :qty_ky
      t.string :kit_qty
      t.float :weight
      t.float :depth
      t.float :height
      t.float :width
      t.string :discontinue
      t.string :picture
      t.string :brand
      t.string :color
      t.string :size
      t.boolean :ormd
      t.boolean :no_export
      t.boolean :special_ord
      t.boolean :oversize
      t.text :note
      t.float :rmatv_price

      # t.integer :PRODNO
      # t.integer :UPC
      # t.string :MF_ID
      # t.float :MSRP
      # t.float :DEALER_PRICE
      # t.string :NAME
      # t.string :QTY_UT
      # t.integer :QTY_KY
      # t.string :KIT_QTY
      # t.float :WEIGHT
      # t.float :DEPTH
      # t.float :HEIGHT
      # t.float :WIDTH
      # t.string :DISCONTINUE
      # t.string :PICTURE
      # t.string :BRAND
      # t.string :COLOR
      # t.float :SIZE
      # t.boolean :ORMD
      # t.boolean :NO_EXPORT
      # t.boolean :SPECIAL_ORD
      # t.boolean :OVERSIZE
      # t.text :NOTE
      # t.float :RMATV_PRICE

      t.timestamps
    end
  end
end
