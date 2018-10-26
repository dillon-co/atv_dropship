class AdminDashboardController < ApplicationController

  def orders
    if admin_signed_in?

      @total_profit = Order.total_profit.round(2)
      @orders = Order.where(order_status: :paid)
    end
  end

  def curent_items
  end
end
