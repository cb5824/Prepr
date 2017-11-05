require 'rails_helper'


feature 'recipes' do
  let!(:item1) do
    FactoryBot.create(:item)
  end

  let!(:item2) do
    FactoryBot.create(:item)
  end

  let!(:recipe) do
    FactoryBot.create(:recipe)
  end

  scenario "a recipe has many items via a join table" do
    recipe.items << item1
    recipe.items << item2

    visit recipes_path
    click_link recipe.name
    expect(page).to have_content(item1.name)
    expect(page).to have_content(item2.name)
  end
end
