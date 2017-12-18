class Api::V1::StoresController < ApplicationController

  def index
  end

  def edit
  end

  def update
    pairs = params['pairs'].values
    store = Store.find(params['id'])
    pairs.each do |pair|
      new_isle = pair[1]

      if new_isle != ""
        if new_isle.length == 1
          new_isle = "0" + new_isle
        end
        location = Location.find_by(store_id: store.id, item_id: pair[0])
        if location
          location.isle = new_isle
        else
          location = Location.new(store_id: store.id, item_id: pair[0], isle: new_isle)
        end
        location.save
      end

    end
    @pairs = pairs
    render json: @pairs, status: :ok
  end

  private

end
