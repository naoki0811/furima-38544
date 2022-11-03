class OrdersController < ApplicationController
  before_action :authenticate_user!, only: [:index]
  before_action :set_item, only: [:index, :create]


  def index
    @order_destination = OrderDestination.new
    if @item.user_id == current_user.id || @item.order.present?
       redirect_to root_path
    end
  end

  def create
    @order_destination = OrderDestination.new(order_params)
    if @order_destination.valid?
       pay_item
       @order_destination.save
       redirect_to root_path
    else
      render :index
    end
  end

  private

  def set_item
    @item = Item.find(params[:item_id])
  end

  def order_params
    params.require(:order_destination).permit(:post_code, :prefecture_id, :city, :address, :build, :phone_number).merge(user_id: current_user.id, item_id: @item.id, token: params[:token])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
      Payjp::Charge.create(
        amount: @item.price,  
        card: order_params[:token],    
        currency: 'jpy'                 
      )
    end
end

