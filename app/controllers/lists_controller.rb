class ListsController < ApplicationController

before_action :authenticate_user!

  def index
    @lists = List.page(params[:page]).per_page(5)
  end

  def new
    @list = List.new
    @list.user = current_user
    @list.save
    redirect_to edit_list_path (@list)
  end

  def edit
    @list = List.find(params[:id])
    @recipes = Recipe.all
  end

  def show
    @list = List.find(params[:id])
    @aisles = []
    @store = current_user.store
    @items = Item.includes(:lists, :locations, :lineitems).where(lists: {id: params[:id]} ).to_a
    @items.each do |item|
      if item.locations.select{|location| location.store_id == @store.id} == []
        @aisles << nil
      else
        @aisles << item.locations.select{|location| location.store_id == @store.id}[0].aisle
      end
    end
  end

  def update

  end

end
