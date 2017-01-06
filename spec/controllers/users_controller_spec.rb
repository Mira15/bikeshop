require 'rails_helper'

describe UsersController, :type => :controller do
  before do
    #@user = FactoryGirl.create(:user)
    #@user2 = FactoryGirl.create(:user)
    @user1 = User.create!(email: "me@example.com", password: "pass123")
    @user2 = User.create!(email: "you@example.com", password: "pass456")
  end
  describe 'GET #show' do
    context 'User is logged in' do
      before do
        sign_in @user2
      end
      it 'loads correct user details'do
        get :show, id: @user2.id
        expect(response).to be_success
        expect(response).to have_http_status(200)
        expect(assigns(:user)).to eq @user2
      end
      it 'responds with an HTTP 401 status code' do
        get :show, id: @user1.id
        expect(response).to_not be_success
        expect(response).to have_http_status(401)
      end
      #it 'redirects User to login' do
        #get :show, id: @user.id
        #expect(response).to redirect_to(root_path)
      #end
    end
    #context 'No user is logged in' do
      #it 'redirects to login' do
        #get :show, id: @user2.id
        #expect(response).to redirect_to(root_path)
      #end
    #end
  end

end