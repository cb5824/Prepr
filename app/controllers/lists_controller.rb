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
end
