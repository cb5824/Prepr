class List < ApplicationRecord
  has_many :lineitem
  has_many :recipes
  has_many :items, :through => :lineitem


end
