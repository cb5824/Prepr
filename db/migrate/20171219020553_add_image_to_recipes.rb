class AddImageToRecipes < ActiveRecord::Migration[5.1]
  def change
    add_column :recipes, :image, :string, default: "http://localhost:3000/assets/default.png"
  end
end
