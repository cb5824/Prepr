class RecipesController < ApplicationController

  before_action :authenticate_user!, except: [:index, :show]

  def index
    @recipes = Recipe.page(params[:page]).per_page(10)
  end

  def show
    @recipe = (Recipe.includes(:items, :ingredients).where(id: params[:id]))[0]
  end

  def new
    @items = Item.all
    @recipe = Recipe.new
    @ingredients = nil
  end

  def edit
    @recipe = Recipe.find(params['id'])

    if params['list_id']
      list = List.find(params['list_id'])
      @recipe.items.each do |item|
        list.items << item
      end
      redirect_to edit_list_path(list)
    end
  end


  def update
    @recipe = Recipe.find(params['id'])

    if @recipe.update_attributes(recipe_params)
      redirect_to @recipe, notice: 'Recipe updated successfully.'
    else
      @errors = @recipe.errors.full_messages
      render action: 'edit'
    end
  end

  def create
    @recipe = Recipe.new(recipe_params)
    @recipe.user = current_user
    if @recipe.save
      redirect_to edit_recipe_path(@recipe), notice: 'Recipe was saved successfully, add ingredient amounts here!'
    else
      @errors = @recipe.errors.full_messages
      render action: 'new'
    end
  end

  private

  def recipe_params
  params.require(:recipe).permit(:name, :servings, :duration, :directions, :image, :list_id)
  end

end
