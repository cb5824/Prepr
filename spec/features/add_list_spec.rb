require 'rails_helper'


feature 'Adding a new list' do
  let!(:item1) do
    FactoryBot.create(:item)
  end

  let!(:item2) do
    FactoryBot.create(:item)
  end

  let!(:recipe1) do
    FactoryBot.create(:recipe)
  end

  let!(:list) do
    List.create
  end


  scenario 'user adds a recipe to a list' do
    recipe1.items << item1
    recipe1.items << item2
    visit edit_list_path (list)

    click_link(recipe1.name)

    expect(list.items).to include(item1)
    expect(list.items).to include(item2)
  end
end
