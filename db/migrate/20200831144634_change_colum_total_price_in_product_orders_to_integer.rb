class ChangeColumTotalPriceInProductOrdersToInteger < ActiveRecord::Migration[5.2]
  def change
    change_column :product_orders, :total_price, :integer
  end
end
