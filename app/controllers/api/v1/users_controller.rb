class Api::V1::UsersController < ApplicationController

  def index
  end

  def edit
    name = params['store_name']
    address = params['store_address']
    store_search = Store.find_by(name: name, address: address)
    if store_search
      current_user.store = store_search
    else
      current_user.store = Store.create(name: name, address: address)
    end
    current_user.save
  end

  def update
  end

  private

end
