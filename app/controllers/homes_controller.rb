class HomesController < ApplicationController
  def index
    ordered_recipes = Recipe.includes(:favorites).sort_by {|recipe| recipe.created_at}
    @recent_recipes = ordered_recipes[0..3]
    @top_recipes = (ordered_recipes.sort_by {|recipe| recipe.favorites.length}).reverse.shift(5)
    @recipes = Recipe.paginate(:page => params[:page], :per_page => 5)
    if user_signed_in? && current_user.lists[0].nil?
      @current_list = List.create(user_id: current_user.id)
    end
  end
end
