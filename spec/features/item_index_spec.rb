require 'rails_helper'


feature 'view a list of all items in the database' do
  let!(:item1) do
    FactoryBot.create(:item)
  end

  let!(:item2) do
    FactoryBot.create(:item)
  end

  scenario "all items are present" do
    visit items_path

    expect(page).to have_content(item1.name)
    expect(page).to have_content(item2.name)
  end
end
