class Public::ItemsController < ApplicationController
  def index
    @genres = Genre.all
    if params[:genre_id]
      @items = Item.where(is_sold: true).where(genre_id: params[:genre_id])
    else
      @items = Item.where(is_sold: true)
    end
  end

  def show
    @item = Item.find(params[:id])
    @cart_item = CartItem.new
  end
end
