class List < ApplicationRecord
  has_many :lineitems
  has_many :recipes
  has_many :items, :through => :lineitems
  belongs_to :user

  def get_list_items(user)

    # lines = Lineitem.includes(:items).where(list_id: current_user.lists.first.id)
    result = []
    # located_items = Item.includes(:locations, :lineitems).where(lineitems: {list_id: 2}).where(locations: {store_id: [user.store.id, nil] })
    items = Item.includes(:locations, :lineitems).where(lineitems: {list_id: 2})
    items.each do |item|
      isle = nil
      if item.locations != []
        item.locations.each do |location|
          if location.store_id == user.store.id
            isle = location.isle
          end
        end
      end
      result << [item, isle, item.lineitems[0].amount]
    end
    result
  end

  def delete_list_item(item)
    lineitem = Lineitem.find_by(item_id: item.id, list_id: self.id)
    lineitem.destroy
  end

  def add_list_item(item_name, quantity, store)
    list_addition = Item.find_by(name: item_name)
    if list_addition.nil?
      list_addition = Item.create(name: item_name)
    end

    new_line = Lineitem.create(item_id: list_addition.id, list_id: self.id, amount: quantity)
    item_location = Location.find_by(store_id: store.id, item_id: list_addition.id)
    if item_location.nil?
      isle = '__'
    else
      isle = item_location.isle
    end
    return [list_addition.name, list_addition.id, new_line.amount, isle]
  end

  def add_recipe_items(recipe, store)
    result = []
    recipe.items.each do |item|
      recipe_listing = Ingredient.find_by(recipe_id: recipe.id, item_id: item.id)
      item_location = Location.find_by(store_id: store.id, item_id: item.id)
      if item_location.nil?
        isle = '__'
      else
        isle = item_location.isle
      end
      listing = Lineitem.create(item_id: item.id, list_id: self.id, amount: recipe_listing.quantity)
      result << [item.name, item.id, listing.amount, isle]
    end
    return result
  end

end
