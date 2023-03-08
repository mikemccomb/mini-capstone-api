class ImagesController < ApplicationController
  def index
    @images = Image.all
    render :index
  end

  def show
    @image = Image.find_by(id: params[:id])
    render :show
  end

  def create
    @image = Image.new(url: params[:url])
    @image.save

    if @image.valid?
      render :show
    else
      @image.errors.full_messages
      render status: :unprocessable_entity
    end
  end

  def update
    @image = Image.find_by(id: params[:id])
    @image.update(
      url: params[:url] || @image.url,
    )
    if @image.valid?
      render :show
    else
      @image.errors.full_messages
      render status: :unprocessable_entity
    end
  end

  def destroy
    image = Image.find_by(id: params[:id])
    image.delete
    render json: { message: "Bye girl bye" }
  end
end
