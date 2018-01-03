class HomesController < ApplicationController
  def index
    @recipe_array = Recipe.all.sort_by {|recipe| recipe.created_at}
    @recent_recipes = @recipe_array[0..3]
    @top_recipes = Recipe.top_five
  end
end
