class Ingredient < ApplicationRecord
  belongs_to :recipe
  belongs_to :item
  has_many :lists

end
