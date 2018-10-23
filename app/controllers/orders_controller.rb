class OrdersController < ApplicationController
  def new
    # @prod = Inventory.find_by(prodno: params[:prodno])
    @order = Order.new

  end

  def confirm
    @order = current_order
    @order_items = @order.order_items
  end

  def create
    order = Order.new(order_params)
    if order.save
      redirect_to new_charge_path(order_id: order.id)
    else
      render :new
    end
  end

  def edit
    @order = current_order
  end

  def update
    current_order.update_attributes(order_params)
    if current_order.save
      redirect_to confirm_order_path(order_id: current_order.id)
    end
  end
  private

  def order_params
    params.require(:order).permit(:user_name,
                                    :first_name,
                                    :last_name,
                                    :phone,
                                    :text_deals,
                                    :email,
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
