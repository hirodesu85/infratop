class Public::ItemsController < ApplicationController
  def index
    @items = Item.where(is_sold: true)
  end

  def show
    @item = Item.find(params[:id])
    @cart_item = CartItem.new
  end
end
