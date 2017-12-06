class OrderItemsController < ApplicationController
  def create
    @order = current_order
    @item = @order.order_items.new(item_params)
    if @order.save
      session[:order_id] = @order.id
      flash[:notice] = "Item added to cart."
      respond_to do |format|
        format.html { redirect_to product_path }
        format.js
      end
    end
  end
  redirect_to products_path
end

  private

  def item_params
    params.require(:order_item).permit(:quantity, :product_id)
  end
end
