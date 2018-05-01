class HomesController < ApplicationController
  def index
    ordered_recipes = Recipe.includes(:favorites).sort_by {|recipe| recipe.created_at}
    @recent_recipes = ordered_recipes[0..4]
    @top_recipes = (ordered_recipes.sort_by {|recipe| recipe.favorites.length}).reverse.shift(5)
    @recipes = Recipe.paginate(:page => params[:page], :per_page => 5)
    if user_signed_in? && current_user.lists[0].nil?
      current_user.store = Store.find_or_create_by(name: 'Stop & Shop', address: '779 McGrath Hwy (Blakely Ave), Somerville, MA 02145, United States')
      current_user.save
      @current_list = List.create!(user: current_user)
      @current_list.save
    end
  end
end
