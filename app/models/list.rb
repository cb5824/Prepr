class List < ApplicationRecord
  has_many :lines
  has_many :items, :through => :lines

end
