require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do
    it 'should save successfully when all four fields are filled out' do
      @category = Category.new({ name: 'Evergreens' })
      @product = Product.new({ name: 'Sweet Hops', price_cents: 64.49, quantity: 40,
                               category: @category })
      expect(@product.save).to be true
    end
    it 'should raise an error if no name is provided' do
      @category = Category.new({ name: 'Evergreens' })
      @product = Product.new({ name: nil, price_cents: 64.49, quantity: 40,
                               category: @category })
      expect(@product.save).to_not be true
      expect(@product.errors.full_messages[0]).to include('Name can\'t be blank')
    end
    it 'should raise an error if no price is provided' do
      @category = Category.new({ name: 'Evergreens' })
      @product = Product.new({ name: 'Sweet Hops', price_cents: nil, quantity: 40,
                               category: @category })
      expect(@product.save).to_not be true
      expect(@product.errors.full_messages[0]).to include('Price cents is not a number')
    end
    it 'should raise an error if no quantity is provided' do
      @category = Category.new({ name: 'Evergreens' })
      @product = Product.new({ name: 'Sweet Hops', price_cents: 64.49, quantity: nil,
                               category: @category })
      expect(@product.save).to_not be true
      expect(@product.errors.full_messages[0]).to include('Quantity can\'t be blank')
    end
    it 'should raise an error if no category is provided' do
      @category = Category.new({ name: 'Evergreens' })
      @product = Product.new({ name: 'Sweet Hops', price_cents: 64.49, quantity: 40,
                               category: nil })
      expect(@product.save).to_not be true
      expect(@product.errors.full_messages[0]).to include('Category must exist')
    end
  end
end
