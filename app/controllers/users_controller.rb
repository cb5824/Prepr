class UsersController < ApplicationController
  def show
    @user = current_user
    @created_recipes = Recipe.where(user_id: @user.id)
  end
end
