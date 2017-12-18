class Item < ApplicationRecord
  has_many :ingredients
  has_many :recipes, :through => :ingredients
  has_many :lineitem
  has_many :lists, :through => :lineitem
  has_many :locations
  has_many :stores, :through => :locations

  validates :name, uniqueness: true

end
