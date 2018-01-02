class CreateFavorites < ActiveRecord::Migration[5.1]
  def change
    create_table :favorites do |t|
      t.belongs_to :user, index: true
      t.belongs_to :recipe, index: true
    end
  end
end
