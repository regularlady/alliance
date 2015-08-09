FactoryGirl.define do
  factory :user do
    sequence(:email) { |n| "hello#{n}@alliance.org" }
    title         "Ruler"
    password  "password"
    password_confirmation "password"
    confirmed_at Time.now
  end
end