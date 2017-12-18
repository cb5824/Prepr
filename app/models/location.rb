class Location < ApplicationRecord
  belongs_to :store
  belongs_to :item

end
