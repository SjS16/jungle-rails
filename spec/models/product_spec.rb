require 'rails_helper'

RSpec.describe Product, type: :model do
  before :example do
    @category = Category.create
    @product = @category.products.create!({
      name:  'Table',
      description: 'sturdy, wooden',
      quantity: 7,
      price_cents: 3_000
    })
  end

  after :example do
    @product.destroy!
    @category.destroy!
  end

  describe 'Validations' do
    it 'is valid' do
      expect(@product).to be_valid
    end 

    it 'is not valid without a name' do
      @product.name = nil
      expect(@product).to_not be_valid;
      expect(@product.errors.full_messages).to include "Name can't be blank"
    end

    it 'is not valid without a price' do
      @product.price_cents = nil
      expect(@product.valid?).to be false;
      expect(@product.errors.full_messages).to include "Price cents can't be blank"
    end

    it 'is not valid without a quantity' do
      @product.quantity = nil
      expect(@product.valid?).to be false;
      expect(@product.errors.full_messages).to include "Quantity can't be blank"
    end

    it 'is not valid without a category' do
      @product.category = nil
      expect(@product.valid?).to be false;
      expect(@product.errors.full_messages).to include "Category can't be blank"
    end

  end
end
