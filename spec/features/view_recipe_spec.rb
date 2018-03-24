require 'rails_helper'

feature 'viewing recipes' do

  let!(:item1) do
    FactoryBot.create(:item)
  end

  let!(:item2) do
    FactoryBot.create(:item)
  end

  let!(:recipe) do
    FactoryBot.create(:recipe)
  end


  scenario 'Users cannot edit recipes they did not create' do
    sign_in_user
    visit recipe_path(recipe)
    expect(page).to_not have_content('Edit this recipe')
  end

  scenario 'Unauthenticated users cannot edit recipes' do
    visit recipe_path(recipe)
    expect(page).to_not have_content('Edit this recipe')

  end

  scenario 'Users can edit recipes they did create' do
    sign_in_specific_user(recipe.user)
    visit recipe_path(recipe)
    expect(page).to have_content('Edit this recipe')
  end

  scenario 'Viewing a recipe displays all of its ingredients' do
    recipe.items << item1
    recipe.items << item2

    visit recipe_path(recipe)
    recipe.items.each do |item|
      expect(page).to have_content(item.name)
    end

  end
end
