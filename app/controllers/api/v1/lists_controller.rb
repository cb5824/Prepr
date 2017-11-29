class Api::V1::ListsController < ApplicationController

  def index
    lists = List.all

    render json: lists
  end

  def edit
    binding.pry
  end

  def update
    @list = List.find(params['id'])

    if Item.find_by(name: params['iname']).nil?
      @new_item = Item.create(name: params['iname'])
    else
      @new_item = Item.find_by(name: params['iname'])
    end
    @new_line_item = Lineitem.create(item_id: @new_item.id, list_id: @list.id)
  end

  private

end
