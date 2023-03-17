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
      @carted_products = current_user.carted_products
      carted = []
      @carted_products.each do |item|
        if item[:status] == "carted"
          carted << item
        end
      end
      @carted_products = carted
      render :index
    else
      render json: [], status: :unauthorized
    end
  end

  def destroy
    @carted_product = CartedProduct.find_by(id: params[:id])
    @carted_product.update(status: "removed")
    render json: { message: "Removed from cart" }
  end
end
