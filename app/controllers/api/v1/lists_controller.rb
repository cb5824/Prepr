class Api::V1::ListsController < ApplicationController

  def index
    lists = List.all

    render json: lists
  end

  def edit
    binding.pry
  end

  def update #there is a bug here somewhere... it tries to create an item
    @list = List.find(params['id'])
    @result = []
    if params['item_id']
      lineitem = Lineitem.find_by(item_id: params['item_id'], list_id: @list.id)
      lineitem.destroy
    else

      if params['recipe_id']
        recipe = Recipe.find(params['recipe_id'])
        recipe.items.each do |item|
          @list.items << item
          @result << [item.name, item.id]
        end

      else

        if Item.find_by(name: params['iname']).nil?
          @new_item = Item.create(name: params['iname'])
        else
          @new_item = Item.find_by(name: params['iname'])
        end
        @new_line_item = Lineitem.create(item_id: @new_item.id, list_id: @list.id)
        @result << [@new_item.name, @new_item.id]
      end
    end
    # @result = [@list.items]
    render json: @result, status: :ok
  end

  private

end
