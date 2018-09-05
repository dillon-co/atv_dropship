class CreateVehicles < ActiveRecord::Migration[5.0]
  def change
    create_table :vehicles do |t|
      t.references :user, foreign_key: true
      t.integer :type
      t.integer :make
      t.integer :model
      t.integer :year

      t.timestamps
    end
  end
end
