require 'rails_helper'

describe Client do

  it "has the right first_name" do
    client = Client.create(first_name: "client")
    client.first_name.should == "client"
  end

  it "fails to validate without a first name" do
    blank_client_first_name = Client.create()
    expect { blank_client_first_name.save! }.to raise_error 
    blank_client_first_name.errors.messages[:first_name].first.should == "can't be blank"
  end

  it "fails to validate without last name" do
    blank_client_last_name = Client.create()
    expect { blank_client_last_name.save! }.to raise_error 
    blank_client_last_name.errors.messages[:last_name].first.should == "can't be blank"
  end

  it "fails to validate without phone" do
    blank_client_phone = Client.create()
    expect { blank_client_phone.save! }.to raise_error 
    blank_client_phone.errors.messages[:phone].first.should == "can't be blank"
  end

  it "deletes the Client if the associated user is deleted" do
    user = User.create(email: "hello@alliance.org", password: "helloworld")
    user_client = Client.create(first_name: "Rachel", last_name: "Green", phone: "111-123-1234")
    user.clients << user_client
    expect { user.destroy}.to_not change {Client.count}
  end
end
