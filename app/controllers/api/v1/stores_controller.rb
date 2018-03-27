class Api::V1::StoresController < ApplicationController

  def index
  end

  def edit
  end

  def update
    pairs = params['pairs'].values
    store = Store.find(params['id'])
    pairs.each do |pair|
      new_aisle = pair[1]

      if new_aisle != ''
        if new_aisle.length == 1
          new_aisle = '0' + new_aisle
        end
        location = Location.find_by(store_id: store.id, item_id: pair[0])
        if location
          location.aisle = new_aisle
        else
          location = Location.new(store_id: store.id, item_id: pair[0], aisle: new_aisle)
        end
        location.save
      end

    end
    @pairs = pairs
    render json: @pairs, status: :ok
  end

  private

end
