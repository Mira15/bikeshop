require 'rails_helper'

describe Order do

  before do
    @product = Product.create!(name: "race bike")
    @user = User.create!(email: "me@example.com", password: "passwort")
  end

  it "is valid" do
    expect(Order.new(product: @product, user: @user)).to be_valid
  end

end