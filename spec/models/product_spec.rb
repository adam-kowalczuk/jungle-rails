require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do
    it 'should save successful when all four fields are filled out' do
      @category = Category.new({ name: 'Evergreens' })
      @product = Product.new({ name: 'Sweet Hops', price: 64.49, quantity: 40,
                               category: @category })
      expect(@product.save).to be true
    end
  end
end
