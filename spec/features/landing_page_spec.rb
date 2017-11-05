require 'rails_helper'


feature 'user sees the landing page' do

  scenario "user navigates to the landing page" do
    visit root_path

    expect(page).to have_link('List of all items')
    expect(page).to have_link('List of all recipes')

  end
end
