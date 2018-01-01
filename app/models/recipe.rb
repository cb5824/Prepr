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
end
