require 'rails_helper'

describe User do
  before do
    @user = User.create!(email: "me@example.com", password: "passwort")
  end
  it "should not create user without email" do
    @user.email = nil
    expect(@user).to_not be_valid
  end
end