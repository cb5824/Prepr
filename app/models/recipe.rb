class Recipe < ApplicationRecord
  has_many :ingredients
  has_many :items, :through => :ingredients
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
end
