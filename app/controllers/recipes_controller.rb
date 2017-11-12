class RecipesController < ApplicationController

  def index
    @recipes = Recipe.all
  end

  def show
    @recipe = Recipe.find(params[:id])
  end

  def new
    @items = Item.all
    @recipe = Recipe.new
  end

  def edit
    # binding.pry
    @recipe = Recipe.find(params['id'])
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
    ingredients = recipe_params['initial_ingredients'].split(', ')

    ingredients.each do |ingredient|
      if (Item.find_by name: ingredient).nil?
        new_item = Item.new(name: ingredient)
      else
        new_item = Item.find_by name: ingredient
      end
        @recipe.items << new_item
    end

    if @recipe.save
      redirect_to edit_recipe_path(@recipe), notice: 'Recipe was saved successfully, add ingredient amounts here!'
    else
      @errors = @recipe.errors.full_messages
      render action: 'new'
    end
  end

  private

  def recipe_params
  params.require(:recipe).permit(:name, :servings, :duration, :directions, :initial_ingredients)
  end

end
