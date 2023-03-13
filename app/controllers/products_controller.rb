class ProductsController < ApplicationController
  before_action :authenticate_admin, except: [:index, :show]

  def index
    pp current_user
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
      supplier_id: params[:supplier_id],
    )
    @product.save
    render :show
  end

  def update
    @product = Product.find_by(id: params[:id])
    @product.update(
      name: params[:name] || @product.name,
      price: params[:price] || @product.price,
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
