class OrderItemsController < ApplicationController
  def create
    @order = current_order
    @order_item = @order.order_items.new(order_item_params)
    respond_to do |format|
      if @order.save
        puts "order saved"
        format.js {}
      end
    end
    session[:order_id] = @order.id
  end

  def update
    @order = current_order
    @order_item = @order.order_items.find(params[:id])
    @order_item.update_attributes(order_item_params)
    @order_items = @order.order_items
    # @colors = params[:colors]
  end

  def destroy
    @order = current_order
    @order_item = @order.order_items.find(params[:id])
    respond_to do |format|
      @order_item.destroy
      format.js {}
    end
    @order_items = @order.order_items
  end

private
  def order_item_params
    params.require(:order_item).permit(:quantity, :product_id, :unit_price, :prodno, :name, :size, :color, :vehicle_type, :vehicle_year, :vehicle_make, :vehicle_model)
  end
end
