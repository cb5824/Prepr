class ListsController < ApplicationController

  def index
    @lists = List.all
  end

  def new
    @list = List.new
    @list.save
    redirect_to edit_list_path (@list)
  end

  def edit
    @list = List.find(params[:id])
    @recipes = Recipe.all
  end

  def show
    @list = List.find(params[:id])
    @listings = @list.get_list_items
    @store = current_user.store
    @locations = Location.where(store_id: @store.id)
  end
end
