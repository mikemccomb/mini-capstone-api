class CartedProductsController < ApplicationController
  def create
    @carted_product = CartedProduct.create(
      user_id: current_user.id,
      product_id: params[:product_id],
      order_id: nil,
      quantity: params[:quantity],
      status: "carted",
    )
    render :show
  end

  def index
    if current_user
      @carted_products = CartedProduct.all
      render :index
    else
      render json: [], status: :unauthorized
    end
  end

  def destroy
    @carted_product = CartedProduct.find_by(id: params[:id])
    @carted_product[:status] = "removed"
    render json: { message: "Removed from cart" }
  end
end
