class CreateIngredients < ActiveRecord::Migration[5.1]
  def change
    create_table :ingredients do |t|
      t.belongs_to :recipe, index: true
      t.belongs_to :item, index: true
      t.text :quantity
    end
  end
end
