class ChargesController < ApplicationController
  def new
    @cart = Cart.find(params[:cart_id])
    @productcart = ProductCart.where(cart_id: params[:cart_id])
    @total_price = 0
    @productcart.each do |productcart|
      @total_price = productcart.product.price  + @total_price
    end
    
  end
  
  def create
    # Amount in cents
    @cart = Cart.find(params[:cart_id])
    @productcart = ProductCart.where(cart_id: params[:cart_id])
    @total_price = 0
    @productcart.each do |productcart|
      @total_price = productcart.product.price  + @total_price
    end
    @amount = @total_price * 100
    
    @current_user = User.find(params[:user_id])
    order = Order.create(user_id: current_user.id)
    @productcart = ProductCart.where(cart_id: params[:cart_id])
    @productcart.each do |productcart|
      ProductOrder.create(order_id: order.id, product_id: productcart.product.id, quantity: 1, total_price: productcart.product.price)
    end
    
  
    customer = Stripe::Customer.create({
      email: params[:stripeEmail],
      source: params[:stripeToken],
    })
  
    charge = Stripe::Charge.create({
      customer: customer.id,
      amount: @amount,
      description: 'Rails Stripe customer',
      currency: 'eur',
    })
    
    Order.find(order.id).update(stripe_customer_id: customer.id)
    @cart = Cart.where(user_id: current_user.id)
    @user_cart = ProductCart.where(cart: @cart)
    @user_cart.each do |product| ProductCart.find(product.id).destroy end
    redirect_to user_path(@current_user)
    
  rescue Stripe::CardError => e
    flash[:error] = e.message
    redirect_to new_charge_path
  end
  
end
