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

  # scenario "saving a new recipe creates item objects for new ingredients" do
  #   visit root_path
  #
  #   click_link('Add new recipe')
  #
  #   fill_in('Name', :with => 'pancakes')
  #   fill_in('Servings', :with => '3')
  #   fill_in('Duration (in minutes)', :with => 30)
  #   fill_in('Directions', :with => 'mix stuff in a bowl, heat on a skillet, serve with syrup')
  #   click_button('Create Recipe')
  #
  #   fill_in('ingredient_name', :with => 'flour')
  #   fill_in('ingredient_quantity', :with => '2 cups')
  #   click_button('Add ingredient')
  #   # binding.pry
  #   expect(Item.find_by name: 'flour').to_not eq(nil)
  #   # expect(Item.find_by name: 'sugar').to_not eq(nil)
  #   # expect(Item.find_by name: 'butter').to_not eq(nil)
  #   # expect(Item.find_by name: 'eggs').to_not eq(nil)
  #   # expect(Item.find_by name: 'milk').to_not eq(nil)
  # end
end
