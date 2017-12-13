class List < ApplicationRecord
  has_many :lineitem
  has_many :recipes
  has_many :items, :through => :lineitem

  def get_list_items
    result = []
    lines = Lineitem.where(list_id: self.id)
    lines.each do |line|
      result << [Item.find(line.item_id), line.amount]
    end
    result
  end

end
