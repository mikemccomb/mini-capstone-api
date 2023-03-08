class SuppliersController < ApplicationController
  def index
    @suppliers = Supplier.all
    render :index
  end

  def show
    @supplier = Supplier.find_by(id: params[:id])
    render :show
  end

  def create
    @supplier = Supplier.new(
      name: params[:name],
      email: params[:email],
      phone_number: params[:phone_number],
    )
    @supplier.save

    if @supplier.valid?
      render :show
    else
      @supplier.errors.full_messages
      render status: :unprocessable_entity
    end
  end

  def update
    @supplier = Supplier.find_by(id: params[:id])
    @supplier.update(
      name: params[:name] || @supplier.name,
      email: params[:email] || @supplier.email,
      phone_number: params[:phone_number] || @supplier.phone_number,
    )
    if @supplier.valid?
      render :show
    else
      @supplier.errors.full_messages
      render status: :unprocessable_entity
    end
  end

  def destroy
    supplier = Supplier.find_by(id: params[:id])
    supplier.delete
    render json: { message: "Bye girl bye" }
  end
end
