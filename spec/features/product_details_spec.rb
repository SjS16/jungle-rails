require 'rails_helper'

RSpec.feature "Visitor navigates to specific product", type: :feature, js: true do

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

  scenario "They see the products" do
    # ACT
    visit root_path

    first('article.product header').find('a[href^="/products/"]').click
    
    sleep 2
    # DEBUG
    save_screenshot "product.png"

    # VERIFY
    expect(page).to have_css('.products-show')
  end

end
