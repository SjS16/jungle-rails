require 'rails_helper'

RSpec.feature "Visitor adds product to cart", type: :feature, js: true do

  # SETUP
  before :each do
    @category = Category.create! name: 'Apparel'

    10.times do |n|
      @category.products.create!(
        name:  Faker::Hipster.sentence(3),
        description: Faker::Hipster.paragraph(4),
        image: open_asset('apparel1.jpg'),
        quantity: 10,
        price: 64.99
      )
    end
  end

  scenario "They add a product" do
    # ACT
    visit root_path

    first('article.product footer').find_link("Add").click

    # DEBUG
    save_screenshot "addtocart.png"

    # VERIFY
    expect(page).to have_text "My Cart (1)"
  end
end
