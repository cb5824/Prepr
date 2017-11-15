class Item < ApplicationRecord
  has_many :ingredients
  has_many :recipes, :through => :ingredients
  has_many :lists, :through => :lines
  validates :name, uniqueness: true

end
