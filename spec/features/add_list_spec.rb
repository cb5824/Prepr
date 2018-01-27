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


end
