class ChargesController < ApplicationController
  rescue_from Stripe::CardError, with: :catch_exception
  def new
    @order = Order.find(params[:order_id])
    @order_items = @order.order_items
  end

  def create
    order = current_order
    @amount = (order.total.round(2) * 100).to_i

    customer = Stripe::Customer.create(
      :email => params[:stripeEmail],
      :source  => params[:stripeToken]
    )

    charge = Stripe::Charge.create(
      :customer    => customer.id,
      :amount      => @amount,
      :description => 'CC1 Motorsports Order',
      :currency    => 'usd'
    )
    order.update(order_status: :paid)
    current_order = Order.new

    redirect_to receipt_path(order_id: order.id)

    rescue Stripe::CardError => e
      flash[:error] = e.message
      redirect_to confirm_order_path(order)
  end

  private

  def charges_params
    params.permit(:stripeEmail, :stripeToken, :order_id)
  end

  def catch_exception(exception)
    flash[:error] = exception.message
  end
end
