def create_coach_with_clients
  @coach = FactoryGirl.create(:confirmed_user_with_clients)
end

When(/^create several clients$/) do
  create_coach_with_clients
end

Then(/^I should see my list of clients\.$/) do
  @clients = @coach.clients
  expect(current_path).to eq("/clients")
  expect(@clients.count).to eq(5)
end