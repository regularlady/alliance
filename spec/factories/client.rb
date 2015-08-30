require 'factory_girl'

FactoryGirl.define do
  factory :client do
    user
    first_name    "Regina"
    last_name     "Phalange"
    phone         "+15005550006"
    email         "hello@alliance.org"
  end
end
