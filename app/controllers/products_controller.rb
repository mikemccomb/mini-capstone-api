class ProductsController < ApplicationController
  def index
    @products = Product.all
    render :index
  end

  def show
    @product = Product.find_by(id: params[:id])
    render :show
  end

  def create
    @product = Product.create(
      name: "Socks",
      price: 8,
      image_url: "https://cdn.pixabay.com/photo/2016/12/14/11/34/socks-1906060_1280.jpg",
      description: "Do not wear with sandals",
    )
    render :show
  end
end
