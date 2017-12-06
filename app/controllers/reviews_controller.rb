class ReviewsController < ApplicationController
  def create
    @product = Product.find(params[:product_id])
    @review = @product.reviews.new(review_params)
    @review.update({account_id: current_user.account.id})
    if @review.save
      flash[:notice] = "Review has been saved!"
      respond_to do |format|
        format.html { redirect_to product_path(@product) }
        format.js
      end
    else
     render :new
    end
  end

private

  def review_params
    params.require(:review).permit(:content)
  end

end
