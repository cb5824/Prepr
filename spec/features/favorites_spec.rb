require 'rails_helper'


feature 'Favoriting recipes' do

  let!(:recipe) do
    FactoryBot.create(:recipe)
  end

  let!(:recipe2) do
    FactoryBot.create(:recipe)
  end

  let!(:recipe3) do
    FactoryBot.create(:recipe)
  end

  let!(:recipe4) do
    FactoryBot.create(:recipe)
  end

  let!(:recipe5) do
    FactoryBot.create(:recipe)
  end

  let!(:user) do
    FactoryBot.create(:user)
  end

  let!(:user2) do
    FactoryBot.create(:user)
  end

  scenario 'User favorites a recipe' do

    expect(recipe.favorite_of(user)).to eq(false)

    recipe.make_favorite_of(user)
    expect(recipe.favorite_of(user)).to eq(true)

    recipe.unfavorite_of(user)
    expect(recipe.favorite_of(user)).to eq(false)

  end

  scenario 'Select top 5 favorited recipes' do

    recipe3.make_favorite_of(user)
    recipe3.make_favorite_of(user2)

    recipe2.make_favorite_of(user)

    most_favorite = Recipe.top_five

    expect(most_favorite[0][0]).to eq(recipe3)
    expect(most_favorite[1][0]).to eq(recipe2)
  end

end
