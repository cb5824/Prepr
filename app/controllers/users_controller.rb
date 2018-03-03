class UsersController < ApplicationController
  def show
    @user = current_user
    all_recipes = Recipe.includes(:favorites)
    @created_recipes = all_recipes.where(user_id: @user.id).sort_by{|recipe| recipe.name}
    @favorite_recipes = all_recipes.where(favorites: {user_id: @user.id}).sort_by{|recipe| recipe.name}

  end
end
