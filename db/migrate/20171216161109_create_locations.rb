class CreateLocations < ActiveRecord::Migration[5.1]
  def change
    create_table :locations do |t|
      t.belongs_to :item, index: true
      t.belongs_to :store, index: true
      t.string :aisle
    end
  end
end
