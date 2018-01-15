class List < ApplicationRecord
  has_many :lineitem
  has_many :recipes
  has_many :items, :through => :lineitem
  belongs_to :user

  def get_list_items
    result = []
    lines = Lineitem.where(list_id: self.id)
    lines.each do |line|
      result << [Item.find(line.item_id), line.amount]
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
      isle = "__"
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
        isle = "__"
      else
        isle = item_location.isle
      end
      listing = Lineitem.create(item_id: item.id, list_id: self.id, amount: recipe_listing.quantity)
      result << [item.name, item.id, listing.amount, isle]
    end
    return result
  end

end
