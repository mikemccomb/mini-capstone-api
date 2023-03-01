class ProductsController < ApplicationController
  def all_products
    @products = Product.all
    render template: "products/index"
  end

  def one_product
    @product = Product.find_by(id: params[:id])
    render template: "products/show"
  end

  # def pants
  #   @product = Product.find_by(name: params[:name])
  #   render template: "products/show"
  # end

  # def hats
  #   @product = Product.find_by(name: "Hat")
  #   render template: "products/show"
  # end
end
