class CartedProductsController < ApplicationController
  def create
    @carted_product = CartedProduct.create(
      user_id: params[:user_id],
      product_id: params[:product_id],
      order_id: params[:order_id],
      quantity: params[:quantity],
      status: params[:status],
    )
    render :show
  end
end
