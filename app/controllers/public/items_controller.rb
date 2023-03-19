class Public::ItemsController < ApplicationController
  def index
    @items = Item.where(is_sold: true)
  end

  def show
  end
end
