require 'rails_helper'

# frozen_string_literal: true

RSpec.describe Product, type: :model  do
  describe "product validations" do

    it "should check product validation to be invalid" do
      product = Product.new
      expect(product).to be_invalid
      expect(product.title).to be_nil
      expect(product.description).to be_nil
      expect(product.price).to be_nil
      expect(product.image_url).to be_nil
    end

    it 'should make product valid' do
      product = Product.new(
        title: 'New titile',
        description: 'this is a new description',
        price: 23,
        image_url: "zzzz.jpg"
      )
      expect(product).to be_valid
      expect(product.title).to include('New titile')
      expect(product.description).to include("this is a new description")
      expect(product.price).to eq(23)
      expect(product.image_url).to include("zzzz.jpg")
    end

    it "should return an error when title is blank" do
      product = Product.new(title: nil)
      product.valid?
      expect(product.errors[:title]).to include("can't be blank")
    end

    it "should return an error when description is blank" do
      product = Product.new(description: nil)
      product.valid?
      expect(product.errors[:description]).to include("can't be blank")
    end

    it "should return an error when image_url is blank" do
      product = Product.new(image_url: nil)
      product.valid?
      expect(product.errors[:image_url]).to include("can't be blank")
    end

    it "should return an error when price is blank" do
      product = Product.new(price: nil)
      product.valid?
      expect(product.errors[:price]).to include("is not a number")
    end

    it "should return an error when price is not in range" do
      product = Product.new(price: -1)
      product.valid?
      expect(product.errors[:price]).to include("must be greater than or equal to 1")
    end
  end
end
