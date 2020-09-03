class ChangeColumnInProductCartsTotalpriceToInteger < ActiveRecord::Migration[5.2]
  def change
    change_column :product_carts, :total_price, :integer
  end
end
