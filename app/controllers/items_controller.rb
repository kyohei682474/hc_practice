class ItemsController < ApplicationController
  def new
    @item = Item.new
  end

  def index
    @items = Item.all
  end

  def create
    Item.create(params_item)
  end

  private

  def params_item
    params.require(:item).permit(:name, :price, :image)
  end
end
