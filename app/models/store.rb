class Store < ApplicationRecord

  validates :name, presence: true
  validates :address, presence: true
  has_many :users
  has_many :locations
  has_many :items, :through => :locations

  def locate_item(item)
    location = Location.find_by(store_id: self.id, item_id: item.id)
    if location.isle
      return location.isle
    else
      return ' ' 
    end
  end

end
