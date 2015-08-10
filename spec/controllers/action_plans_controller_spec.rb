require 'rails_helper'

RSpec.describe ActionPlansController, :type => :controller do

  before { User.delete_all }
  before { Client.delete_all }
  before { ActionPlan.delete_all }

  before(:each) do
   @user = FactoryGirl.create(:user)
   sign_in @user
   @client = FactoryGirl.create(:client, user_id: @user.id)
   @action_plan = FactoryGirl.create(:action_plan, client_id: @client.id)
  end

  describe "show for action plan" do
    it "shows an action plan" do
      get :show, id: @action_plan
      response.should be_success
    end
  end

  describe "editing a action_plan" do
    it "edits an action plan" do
      get :edit, id: @action_plan
      response.should be_success
    end
  end
end
