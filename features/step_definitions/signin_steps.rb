## Shared methods
def create_coach
  @coach ||= FactoryGirl.create(:confirmed_user)
end

def sign_in
  visit root_path
  
  click_on "sign in"
  
  fill_in "Email", with: @coach.email
  fill_in "Password", with: @coach.password
  
  click_on "Sign in"
end

## Sign in steps
When(/^I sign in with valid credentials$/) do
  create_coach
  sign_in
end

Then(/^I should be taken to my clients page$/) do
  expect(current_path).to eq("/clients")
end

When(/^I sign in without an email address$/) do
  create_coach
  @coach.email = ''
  sign_in
end

When(/^I sign in without any password$/) do
  create_coach
  @coach.password = ''
  sign_in
end

When(/^I sign in with an invalid email address$/) do
  create_coach
  @coach.email = 'hurleyburL3y@coco-puff.net'
  sign_in
end

When(/^I sign in with an invalid password$/) do
  create_coach
  @coach.password = 'HahaQHAHQa!'
  sign_in
end