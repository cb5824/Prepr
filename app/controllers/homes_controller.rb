class HomesController < ApplicationController
  def index
    @recipe_array = Recipe.all.sort_by {|recipe| recipe.created_at}
    @recent_recipes = @recipe_array[0..3]
    @top_recipes = Recipe.top_five
    if user_signed_in?
      if current_user.lists[0].nil?
        @list = List.new
      else
        @list = current_user.lists[0]
      end
    end
  end
end
