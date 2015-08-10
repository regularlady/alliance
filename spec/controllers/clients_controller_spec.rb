require 'rails_helper'

RSpec.describe ClientsController, type: :controller do

  before { User.delete_all }
  before { Client.delete_all }

  before(:each) do
   @user = FactoryGirl.create(:user)
   sign_in @user
   @client = FactoryGirl.create(:client)
   @user.clients << @client
  end

  describe "signed in user" do
    it "signed in current user should not be nil" do
      @user = FactoryGirl.build(:user)
      @user.save!
      sign_in @user
      subject.current_user.should_not be_nil
    end
  end

  describe "create for clients" do
    it "creates a client" do
      get :new, id: @client
      response.should be_success
    end
  end

  describe "show for clients" do
    it "shows an client" do
      get :show, id: @client
      response.should be_success
    end
  end

  describe "welcome the client" do
    it "to offers to send a welcome message for a client" do
      post :welcome, {:client => @client.id}
      expect(response.status).to eq(302)
    end
  end

  describe "editing a client" do
    it "edits an client" do
      get :edit, id: @client
      response.should be_success
    end
  end

  describe "indexing clients" do
    it "shows an index of clients" do
      get :index
      response.should be_success
    end
  end

  describe "deleting clients" do
    it "destroys the client" do
      expect {
        delete :destroy, id: @client
        }.to change(Client, :count).by(-1)
    end

    it "redirects to the clients list" do
      delete :destroy, id: @client
      response.should redirect_to(clients_url)
    end
  end
end
