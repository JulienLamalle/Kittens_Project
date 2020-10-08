class Order < ApplicationRecord
  belongs_to :user

  has_many :product_orders
  has_many :products, through: :product_orders

  # This callback launch the order_confirmed method which send an email after the UPDATE of the order object.
  # So a user can create several order objects and only receive an email at checkout
  # when they pay thus add a stripe_customer_id to the object.
  # 3 steps :
  # 1. create an order with user_id
  # 2. add every products to the object with the same order_id
  # 3. update the order with the stripe_customer_id -> only then it sends an email

  # after_update :order_confirmed

  def order_confirmed
    OrderMailer.order_confirmed(self).deliver_now
    OrderMailer.new_order_admin(self).deliver_now
  end

end
