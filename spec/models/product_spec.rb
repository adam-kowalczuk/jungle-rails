require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do
    it 'should save successfully when all four fields are filled out' do
      @category = Category.new({ name: 'Evergreens' })
      @product = Product.new({ name: 'Sweet Hops', price: 64.49, quantity: 40,
                               category: @category })
      expect(@product.save).to be true
    end
    it 'should raise an error if no name is provided' do
      @category = Category.new({ name: 'Evergreens' })
      @product = Product.new({ name: nil, price: 64.49, quantity: 40,
                               category: @category })
      expect(@product.save).not_to be true
      expect(@product.errors.full_messages[0]).to include('Name can\'t be blank')
    end
  end
end
