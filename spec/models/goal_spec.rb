require 'rails_helper'

describe Goal do

  it "has the right description" do
    goal = Goal.create(description: "Goal!")
    goal.description.should == "Goal!"
  end

  it "fails to validate without a description" do
    blank_goal_description = Goal.create()
    expect { blank_goal_description.save! }.to raise_error 
    blank_goal_description.errors.messages[:description].first.should == "can't be blank"
  end

  it "does delete the goal if the associated user is deleted" do
    action_plan = ActionPlan.create(description: "Action!")
    action_plan_goal = Goal.create(description: "Pivot!")
    action_plan.goals << action_plan_goal
    expect {action_plan.destroy}.to change {Goal.count}
  end
end