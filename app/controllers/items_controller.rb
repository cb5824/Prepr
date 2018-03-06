class ItemsController < ApplicationController

  def index
    @items = Item.page(params[:page]).per_page(10)
  end

end
