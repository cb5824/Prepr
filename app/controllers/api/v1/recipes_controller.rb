class Api::V1::RecipesController < ApplicationController


  def update
    @recipe = Recipe.find(params['id'])

    if (Item.find_by name: params['iname']).nil?
      ingredient = Item.new(name: params['iname'])
      ingredient.save
    else
      ingredient = Item.find_by name: params['iname']
    end
    @recipe.items << ingredient
    @recipe.save
    binding.pry

    # @recipe.items << @new_ingredient
    # @ingredient_listing = @recipe.ingredients.where(item_id: @new_ingredient.id)
    # @ingredient_listing.last.quantity = params['iquantity']
    # @ingredient_listing = Ingredient.create(item_id: @new_ingredient.id, recipe_id: @recipe.id, quantity: params['iquantity'])
    # binding.pry
  end

  private

  def recipe_params
  params.require(:recipe).permit(:name, :servings, :duration, :directions, :initial_ingredients, :list_id)
  end

end
