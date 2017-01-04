require 'rails_helper'

describe Comment do
  before do
    @product = Product.create!(name: "race bike")
    @user = User.create!(email: "me@example.com", password: "passwort")
    @comment = @product.comments.create!(rating: 5, user: @user, body: "This bike is perfect")
  end

  it "is valid" do
    expect(Comment.new(@comment)).to be_valid
  end

end