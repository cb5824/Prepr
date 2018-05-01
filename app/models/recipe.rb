class Recipe < ApplicationRecord
  has_many :ingredients
  has_many :items, :through => :ingredients
  has_many :favorites
  belongs_to :user
  validates :name, uniqueness: true

  def get_items
    result = []
    ingredients = Ingredient.where(recipe_id: self.id)
    ingredients.each do |ingredient|
      result << [Item.find(ingredient.item_id), ingredient.quantity]
    end
    result
  end

  def favorite_of(user)
    hearts = Favorite.where(user_id: user.id, recipe_id: self.id)
    hearts[0] != nil
  end

  def make_favorite_of(user)
    Favorite.create(user_id: user.id, recipe_id: self.id)
  end

  def unfavorite_of(user)
    hearts = Favorite.find_by(user_id: user.id, recipe_id: self.id)
    hearts.destroy
  end

  def parse_ingredients(quantities, items)
    ingredients = quantities.zip(items)
    ingredients.delete_if {|listing| listing[1] =~ /^\s*$/ }
    self.add_ingredients(ingredients)   
  end

  def add_ingredients(ingredient_array)

    ingredient_array.each do |ingredient|
      new_ingredient = nil
      if Item.find_by(name: ingredient[1]).nil?
        new_ingredient = Item.create(name: ingredient[1])
      else
        new_ingredient = Item.find_by(name: ingredient[1])
      end
      ingredient_listing = Ingredient.create(item_id: new_ingredient.id, recipe_id: self.id, quantity: ingredient[0])
    end
  end
end
