require 'rails_helper'

RSpec.feature "UserLogins", type: :feature, js:true do

  # SETUP
  before :each do
    @user = User.create!({
      first_name:  'John',
      last_name: 'Doe',
      email: 'example@example.com',
      password: 'secrets',
      password_confirmation: 'secrets'
    })
  end

  after :example do
    @user.destroy!
  end

  scenario "They login" do
    # ACT
    visit '/sessions/new'

    within 'form' do
      fill_in id: 'email', with: 'example@example.com'
      fill_in id: 'password', with: 'secrets'

      click_button 'Submit'
    end

    # DEBUG
    save_screenshot "logged_in.png"

    # VERIFY
    expect(page).to have_text "Signed in as"
  end
end
