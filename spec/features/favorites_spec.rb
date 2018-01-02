require 'rails_helper'


feature 'Favoriting recipes' do

  let!(:recipe) do
    FactoryBot.create(:recipe)
  end

  let!(:user) do
    FactoryBot.create(:user)
  end
  scenario 'User favorites a recipe' do

    expect(recipe.favorite_of(user)).to eq(false)

    recipe.make_favorite_of(user)
    expect(recipe.favorite_of(user)).to eq(true)

    recipe.unfavorite_of(user)
    expect(recipe.favorite_of(user)).to eq(false)

  end


end
