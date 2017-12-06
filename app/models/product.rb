class Product < ActiveRecord::Base
  has_many :reviews
  
  def self.lower_stock(current_order)
    current_order.order_items.each do |item|
      product = Product.find(item.product_id)
      product.update({stock: product.stock - item.quantity})
    end
  end

end
