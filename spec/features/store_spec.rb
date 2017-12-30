require 'rails_helper'


feature 'Store selection/saving' do

  scenario "user navigates to store select" do
    sign_in_user
    visit root_path

    click_link('Set Home Store')

    expect(page).to have_selector('input#store_address')
    expect(page).to have_selector('input#store_address')

  end

  scenario "user adds a new store" do
    sign_in_user
    visit root_path

    click_link('Set Home Store')

    fill_in('Store name', :with => 'Stop and Shop')
    fill_in('Store address', :with => '779 McGrath Hwy, Somerville, MA 02145')

    click_button('Create Store')

    test_user = User.all[0]
    expect(test_user.store.name).to eq('Stop and Shop')
    expect(test_user.store.address).to eq('779 McGrath Hwy, Somerville, MA 02145')

  end

end
