class ChargesController < ApplicationController
  rescue_from Stripe::CardError, with: :catch_exception
  def new
    @order = Order.find(params[:order_id])
    @order_items = @order.order_items
  end

  def create
    order = Order.find(params[:order_id])
    @amount = (order.total * 100).round(2)
    customer = Stripe::Customer.create(
      :email => params[:stripeEmail],
      :source  => params[:stripeToken]
    )

    charge = Stripe::Charge.create(
      :customer    => customer.id,
      :amount      => @amount,
      :description => 'Rails Stripe customer',
      :currency    => 'usd'
    )
    order.update(status: :paid)
    redirect_to confirm_order_path(Order.find(params[:order_id]))
    rescue Stripe::CardError => e
      flash[:error] = e.message
      redirect_to confirm_order_path(Order.find(params[:order_id]))
  end

  private

  def charges_params
    params.permit(:stripeEmail, :stripeToken, :order_id)
  end

  def catch_exception(exception)
    flash[:error] = exception.message
  end
end
