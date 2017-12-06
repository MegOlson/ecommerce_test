class OrderItemsController < ApplicationController
  def create
    @order = current_order
    @order.update({account_id: current_user.account.id})
    @item = @order.order_items.new(item_params)
    if @order.save
      session[:order_id] = @order.id
      flash[:notice] = "Item added to cart."
      respond_to do |format|
        format.html { redirect_to product_path }
        format.js
      end
      redirect_to products_path
    end
  end


  def destroy
    @order = current_order
    @item = @order.order_items.find(params[:id])
    @item.destroy
    if @order.save
      flash[:notice] = "Item removed from cart."
      respond_to do |format|
        format.html { redirect_to cart_path }
        format.js
      end
    end
    redirect_to cart_path
  end


  private

  def item_params
    params.require(:order_item).permit(:quantity, :product_id)
  end
end
