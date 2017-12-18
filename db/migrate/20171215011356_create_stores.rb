class CreateStores < ActiveRecord::Migration[5.1]
  def change
    create_table :stores do |t|
      t.text :name, null: false
      t.text :address, null: false
    end
  end
end
