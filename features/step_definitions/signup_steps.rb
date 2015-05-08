## Shared methods
def create_visitor
  @visitor ||= FactoryGirl.build(:user)
end

def sign_up
  visit root_path
  
  click_on "Sign Up Today"

  fill_in "First name", with: @visitor.first_name
  fill_in "Last name", with: @visitor.last_name
  fill_in "Email", with: @visitor.email

  select @visitor[:title], from: "Title"

  fill_in "Password", with: @visitor.password
  fill_in "Password confirmation", with: @visitor.password_confirmation

  click_on "Sign up"
end

## Sign up steps
When(/^I sign up with valid credentials/) do
  create_visitor
  sign_up
end

When(/^I sign up without an email address/) do
  create_visitor
  @visitor.email = nil
  sign_up
end

When(/^I sign up without a validated email address$/) do
  create_visitor
  @visitor.email = "Unknown.Person@example.com"
  sign_up
end

When(/^I sign up without any password/) do
  create_visitor
  @visitor.password = ''
  sign_up
end

When(/^I sign up with a password that is too short$/) do
  create_visitor
  @visitor.password = @visitor.password_confirmation = 'teehee!'
  sign_up
end

When(/^I sign up without a password confirmation/) do
  create_visitor
  @visitor.password = 'heydiddlyhi'
  @visitor.password_confirmation = ''
  sign_up
end

When(/^I sign up without a mismatched password combo$/) do
  create_visitor
  @visitor.password = 'heydiddlyhi'
  @visitor.password_confirmation = 'heydiddlyh1'
  sign_up
end

Then(/^I should see the message "(.*?)"$/) do |message|
  expect(page).to have_content( message )
end