require 'rails_helper'

describe Comment do
  before do
    @product = FactoryGirl.build(:product)
    @user = FactoryGirl.build(:user)
    @comment = @product.comments.new(rating: 5, user: @user, body: "This bike is perfect")
  end

  it "is valid" do
    expect(@comment).to be_valid
  end

end