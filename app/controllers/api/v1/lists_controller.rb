class Api::V1::ListsController < ApplicationController

  def index
    lists = List.all
    render json: lists
  end

  def new
    List.create(user_id: current_user.id)
    if current_user.lists.length > 2
      current_user.lists.first.destroy
    end
  end

  def edit
    binding.pry
  end

  def update
    @result = []
    if params['list_action'] == 'delete'
      deleted_item = Item.find(params['item_id'])
      @current_list.delete_list_item(deleted_item)
    end

    if params['list_action'] == 'add_item'
      @result << @current_list.add_list_item(params['iname'], params['iquantity'], current_user.store)
    end

    if params['list_action'] == 'add-recipe'
      added_recipe = Recipe.find(params['recipe_id'])
      @result << @current_list.add_recipe_items(added_recipe, current_user.store)
    end

    render json: @result, status: :ok
  end

  private

end
