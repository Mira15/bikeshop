require 'rails_helper'

describe Product do 
  context "when the product has comments" do
    before do
      @product = FactoryGirl.create(:product)
      #@product = Product.create!(name: "race bike")
      @user = FactoryGirl.create(:user)
      #@user = User.create!(email: "me@example.com", password: "passwort")
      @product.comments.create!(rating: 1, user: @user, body: "Awful bike")
      @product.comments.create!(rating: 3, user: @user, body: "The bike is okay")
      @product.comments.create!(rating: 5, user: @user, body: "This bike is perfect")
    end
    it "returns the average rating of all comments" do
      expect(@product.average_rating).to eq 3
    end
    it "is not valid" do
      expect(Product.new(description: "Nice bike")).not_to be_valid
    end
  end
  
end