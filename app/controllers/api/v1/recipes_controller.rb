class Api::V1::RecipesController < ApplicationController

  def index
    recipes = Recipe.all

    render json: recipes
  end

  def edit
    @recipe = Recipe.find(params['id'])
    render json: @recipe
  end

  def update
    @recipe = Recipe.find(params['id'])
    if params['heart_action']
      case params['heart_action']
      when 'favorite'
        @recipe.make_favorite_of(current_user)
      when 'unfavorite'
        @recipe.unfavorite_of(current_user)
      end
    else
      if Item.find_by(name: params['iname']).nil?
        @new_ingredient = Item.create(name: params['iname'])
      else
        @new_ingredient = Item.find_by(name: params['iname'])
      end
      @ingredient_listing = Ingredient.create(item_id: @new_ingredient.id, recipe_id: @recipe.id, quantity: params['iquantity'])
    end
  end

  private

  def recipe_params
  params.require(:recipe).permit(:name, :servings, :duration, :directions, :initial_ingredients, :list_id)
  end

end
