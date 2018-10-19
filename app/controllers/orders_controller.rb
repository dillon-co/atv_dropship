class OrdersController < ApplicationController
  def new
    @prod = Inventory.find_by(prodno: params[:prodno])
    @order = Order.new
  end

  def create
    order = Order.new(order_params)
    if order.save
      redirect_to new_charge_path(order_id: order.id)
    else
      render :new
    end
  end

  private

  def order_params
    params.require(:order).permit(:user_name,
                                    :prodno,
                                    :street_address,
                                    :city,
                                    :state,
                                    :zip,
                                    :subtotal,
                                    :tax,
                                    :shipping,
                                    :total)
  end
end
