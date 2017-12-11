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


  # scenario 'user adds a recipe to a list' do
  #   recipe1.items << item1
  #   recipe1.items << item2
  #
  #   # visit root_path
  #   visit edit_list_path(list)
  #
  #   # click_link 'Add new list'
  #
  #   find('.recipe', :text => recipe1.name).click
  #
  #   visit edit_list_path(list)
  #
  #   expect(page).to have_content(item1.name)
  # end
end
