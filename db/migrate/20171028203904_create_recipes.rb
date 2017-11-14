class CreateRecipes < ActiveRecord::Migration[5.1]
  def change
    create_table :recipes do |t|
      t.text :name, null: false
      t.integer :servings, null: false
      t.integer :duration, null: false
      t.text :directions, null: false
      t.text :initial_ingredients
      t.timestamps
    end
  end
end
