require 'factory_girl'

FactoryGirl.define do
  factory :action_plan do
    description   "Best Action Plan Ever!"
    client
  end
end
