require 'rails_helper'


feature 'user sees the landing page' do

  let!(:recipe) do
    FactoryBot.create(:recipe)
  end

  let!(:recipe2) do
    FactoryBot.create(:recipe)
  end

  let!(:user) do
    FactoryBot.create(:user)
  end

  let!(:user2) do
    FactoryBot.create(:user)
  end

  scenario "user navigates to the landing page" do
    visit root_path

    expect(page).to have_link('Add new recipe')
    expect(page).to have_link('List of all recipes')
    expect(page).to have_link('Previous List')

  end

  scenario "An unauthenticated user sees My Account" do
    sign_in_user
    visit root_path
    expect(page).to have_link('My Account')
  end

  scenario "An unauthenticated user does not see My Account" do
    visit root_path
    expect(page).to_not have_link('My Account')
  end

  scenario "List dropdown is hidden by default" do
    visit root_path

    expect(page).to have_selector :css, 'div#list_overlay.hide'

  end

  scenario "Top recipes are displayed" do
    visit root_path
    expect(page).to have_content(recipe.name)
    expect(page).to have_content(recipe2.name)
  end
end
