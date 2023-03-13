class OrdersController < ApplicationController
  def index
    if current_user
      @orders = Order.all
      render :index
    else
      render json: [], status: :unauthorized
    end
  end

  def create
    if current_user
      @order = Order.new(
        user_id: current_user.id,
        product_id: params[:product_id],
        quantity: params[:quantity],
        subtotal: params[:subtotal],
        tax: params[:tax],
        total: params[:total],
      )
      @order.save
      render json: @order.as_json
    else
      render json: [], status: :unauthorized
    end
  end

  def show
    @order = Order.find_by(id: params[:id])
    render :show
  end
end
