class Product < ApplicationRecord
  belongs_to :category
  has_many :product_carts
  has_many :carts, through: :product_carts

  has_many :product_orders
  has_many :orders, through: :product_orders

  validates :name, presence: true
  validates :url, presence: true
  validates :description, presence: true
  validates :price, presence: true, numericality: { greater_than: 0, less_than: 100 }
end
