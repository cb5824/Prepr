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

    ordered_recipes = Recipe.includes(:favorites).sort_by {|recipe| recipe.created_at}
    top_recipes = (ordered_recipes.sort_by {|recipe| recipe.favorites.length}).reverse.shift(5)

    expect(top_recipes[0]).to eq(recipe3)
    expect(top_recipes[1]).to eq(recipe2)
  end

end
