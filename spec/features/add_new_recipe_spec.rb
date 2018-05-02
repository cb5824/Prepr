require 'rails_helper'


feature 'Adding a new recipe/item' do
  let!(:item1) do
    FactoryBot.create(:item)
  end

  let!(:item2) do
    FactoryBot.create(:item)
  end

  scenario "user clicks on add new recipe and can see form" do
    sign_in_user

    visit new_recipe_path

    click_link('Add new recipe')

    expect(page).to have_field('recipe[name]')
    expect(page).to have_field('recipe[servings]')
    expect(page).to have_field('recipe[duration]')
    expect(page).to have_field('recipe[directions]')

  end

end
