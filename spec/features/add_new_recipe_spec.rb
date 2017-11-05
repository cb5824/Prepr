require 'rails_helper'


feature 'Adding a new recipe/item' do
  let!(:item1) do
    FactoryBot.create(:item)
  end

  let!(:item2) do
    FactoryBot.create(:item)
  end

  scenario "user clicks on add new recipe and can see form" do
    visit root_path

    click_link('Add new recipe')

    expect(page).to have_selector('input#recipe_name')
    expect(page).to have_selector('input#recipe_servings')
    expect(page).to have_selector('input#recipe_duration')
    expect(page).to have_selector('input#recipe_directions')

  end
end
