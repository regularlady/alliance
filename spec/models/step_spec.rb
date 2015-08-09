require 'rails_helper'

describe Step do

  it "has the right description" do
    step = Step.create(description: "Step!")
    step.description.should == "Step!"
  end

  it "fails to validate without a description" do
    blank_step_description = Step.create()
    expect { blank_step_description.save! }.to raise_error 
    blank_step_description.errors.messages[:description].first.should == "can't be blank"
  end

  it "does delete the step if the associated user is deleted" do
    goal = Goal.create(description: "Listen!")
    goal_step = Step.create(description: "We were on a break!")
    goal.steps << goal_step
    expect {goal.destroy}.to change {Step.count}
  end
end