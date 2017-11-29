class Item < ApplicationRecord
  has_many :ingredients
  has_many :recipes, :through => :ingredients
  has_many :lineitem
  has_many :lists, :through => :lineitem
  validates :name, uniqueness: true

end
