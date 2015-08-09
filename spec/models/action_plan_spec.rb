require 'rails_helper'

describe ActionPlan do

  it "has the right description" do
    action_plan = ActionPlan.create(description: "Action!")
    action_plan.description.should == "Action!"
  end

  it "fails to validate without a description" do
    blank_action_plan_description = ActionPlan.create()
    expect { blank_action_plan_description.save! }.to raise_error 
    blank_action_plan_description.errors.messages[:description].first.should == "can't be blank"
  end

  it "does delete the action_plan if the associated user is deleted" do
    client = Client.create(first_name: "Ross", last_name: "Geller", phone: "555-555-5555")
    client_action_plan = ActionPlan.create(description: "Pivot!")
    client.action_plans << client_action_plan
    expect {client.destroy}.to change {ActionPlan.count}
  end
end