class CreateLineitems < ActiveRecord::Migration[5.1]
  def change
    create_table :lineitems do |t|
      t.belongs_to :item, index: true
      t.belongs_to :list, index: true
      t.string :amount
    end
  end
end
