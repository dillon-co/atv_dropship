class AddPhoneAndEmailToOrders < ActiveRecord::Migration[5.0]
  def change
    add_column :orders, :phone, :string
    add_column :orders, :text_deals, :boolean
    add_column :orders, :email, :string
    add_column :orders, :subscribed, :boolean    
  end
end
