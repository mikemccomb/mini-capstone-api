class ProductsController < ApplicationController
  def all_products
    @products = Product.all
    render template: "products/index"
  end

  def shirts
    @product = Product.find_by(name: "T-shirt")
    render template: "products/show"
  end

  def pants
    @product = Product.find_by(name: "Blue Jeans")
    render template: "products/show"
  end

  def hats
    @product = Product.find_by(name: "Hat")
    render template: "products/show"
  end
end
