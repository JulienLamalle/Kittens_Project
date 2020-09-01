class OrderMailer < ApplicationMailer
  default from: 'amaury.desbazeille@gmail.com'

  def order_confirmed(order)

    @order = Order.find(order.id)
    @user = User.find(@order.user_id)
    @url  = 'https://kittens-project-develop.herokuapp.com/'

    # create an array with all products ordered
    @products_ordered = Array.new
    Order.find_by(id: @order.id).product_orders.each { |i| (@products_ordered << i.product) }


    mail(to: @user.email, subject: 'Confirmation de votre commande')
  end
end