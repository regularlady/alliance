require 'rails_helper'

describe Role do
  describe "roles" do
    before(:each) do
      @user = FactoryGirl.create(:user)
    end

    it "should not approve incorrect roles" do
      @user.add_role :moderator
      @user.has_role?(:admin).should be_falsey
    end

    it "should approve correct roles" do
      @user.add_role :moderator
      @user.has_role?(:moderator).should be_truthy
    end

    it "should have a member role assigned to it from creation" do
      @user.has_role? :member.should be_truthy
    end
  end
end
