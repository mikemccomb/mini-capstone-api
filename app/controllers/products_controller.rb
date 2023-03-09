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
    @product = Product.new(
      name: params[:name],
      price: params[:price],
      # images: params[:image_url],
      description: params[:description],
    )
    @product.save
    render :show

    # if @product.valid?
    #   Image.create(product_id: @product_id, url: params[:image_url])
    #   render :show
    # else
    #   @product.errors.full_messages
    #   render status: :unprocessable_entity
    # end
  end

  def update
    @product = Product.find_by(id: params[:id])
    @product.update(
      name: params[:name] || @product.name,
      price: params[:price] || @product.price,
      # image_url: params[:image_url] || @product.image_url,
      description: params[:description] || @product.description,
    )
    if @product.valid?
      render :show
    else
      @product.errors.full_messages
      render status: :unprocessable_entity
    end
  end

  def destroy
    product = Product.find_by(id: params[:id])
    product.delete
    render json: { message: "Bye girl bye" }
  end
end
