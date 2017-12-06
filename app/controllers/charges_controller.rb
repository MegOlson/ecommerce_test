class ChargesController < ApplicationController
  def index
    @orders = Order.all
  end

  def new
  end

  def create
    @cart = current_order
    @amount = ((current_order.total_price) * 100).to_i

    customer = Stripe::Customer.create(
      :email => params[:stripeEmail],
      :source  => params[:stripeToken]
    )

    charge = Stripe::Charge.create(
      :customer    => customer.id,
      :amount      => @amount,
      :description => 'Test Order Confirmation',
      :currency    => 'usd',
      :receipt_email => customer.email
    )
    @cart.update(status: 'Placed')

    rescue Stripe::CardError => e
      flash[:error] = e.message
      redirect_to new_charge_path
    end

end
