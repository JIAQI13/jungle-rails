require 'rails_helper'
RSpec.describe Product, type: :model do
    describe 'Validations' do
      
        it  'initial test with four fields' do
            @category = Category.new(name:"123")
            @product = Product.new(
                name:"onetwothree",
                price_cents:123,
                quantity:312,
                category:@category)
            @product.valid?
            expect(@product).to be_valid
        end
        it  'no name' do
            @category = Category.new(name:"123")
            @product = Product.new(
                price_cents:123,
                quantity:312,
                category:@category)
            @product.valid?
            expect(@product).to_not be_valid
        end
        it  'no price_cents' do
            @category = Category.new(name:"123")
            @product = Product.new(
                name:"onetwothree",
                quantity:312,
                category:@category)
            @product.valid?
            expect(@product).to_not be_valid
        end
        it  'no quantity' do
            @category = Category.new(name:"123")
            @product = Product.new(
                name:"onetwothree",
                price_cents:123,
                category:@category)
            @product.valid?
            expect(@product).to_not be_valid
        end
        it  'no category' do
            @product = Product.new(
                name:"onetwothree",
                price_cents:123,
                quantity:321)
            @product.valid?
            expect(@product).to_not be_valid
        end
    end
  end