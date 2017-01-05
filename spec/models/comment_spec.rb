require 'rails_helper'

describe Comment do
  before do
    @product = Product.create!(name: "race bike")
    @user = User.create!(email: "me@example.com", password: "passwort")
    @comment = @product.comments.new(rating: 5, user: @user, body: "This bike is perfect")
  end

  it "is valid" do
    expect(@comment).to be_valid
  end

end