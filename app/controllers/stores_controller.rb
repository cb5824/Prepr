class StoresController < ApplicationController

  before_action :authenticate_user!

  def index
    @stores = Store.all
    @store = Store.new
  end

  def create
    @store = Store.new(store_params)
    if @store.save
      current_user.store = @store
      current_user.save
      render action: 'index', notice: 'Store changed successfully!'
    else
      @errors = @store.errors.full_messages
      render action: 'index'
    end
  end

  private

  def store_params
    params.require(:store).permit(:name, :address)
  end

end
