class UsersController < ApplicationController
  def show
    @user = current_user
    @created_recipes = (Recipe.where(user_id: @user.id)).sort_by{|recipe| recipe.name}
    @favorite_recipes = []
    temp = Favorite.where(user_id: current_user.id)
    temp.each do |favorite|
        @favorite_recipes << favorite.recipe
    end
    @favorite_recipes.sort_by!{|recipe| recipe.name}
  end
end
