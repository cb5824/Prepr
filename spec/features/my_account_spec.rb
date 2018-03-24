require 'rails_helper'

feature 'My Account' do

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

  let!(:user) do
    FactoryBot.create(:user)
  end

  let!(:store) do
    FactoryBot.create(:store)
  end

  scenario 'authenticated user navigates to my account page' do
    sign_in_specific_user(user)
    visit root_path
    click_link('My Account')
    expect(page).to have_content(user.username)
    expect(page).to have_content(user.email)
    expect(page).to have_content('Recipes created')
    expect(page).to have_content('Favorite Recipes')

  end

  scenario 'my account page displays links to each favorited recipe' do
    recipe.make_favorite_of(user)
    recipe2.make_favorite_of(user)
    sign_in_specific_user(user)
    visit root_path
    click_link('My Account')
    expect(page).to have_content(recipe.name)
    expect(page).to have_content(recipe2.name)
    expect(page).to_not have_content(recipe3.name)
    expect(page).to_not have_content(recipe4.name)
  end

  scenario 'my account page displays links to created recipes' do
    sign_in_specific_user(recipe2.user)
    visit root_path
    click_link('My Account')
    expect(page).to_not have_content(recipe.name)
    expect(page).to have_content(recipe2.name)
    expect(page).to_not have_content(recipe3.name)
    expect(page).to_not have_content(recipe4.name)

  end

end
