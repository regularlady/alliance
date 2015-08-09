require 'rails_helper'

describe TextMessage do

  it "has the right content" do
    text_message = TextMessage.create(content: "Text_message!")
    text_message.content.should == "Text_message!"
  end

  it "fails to validate without a content" do
    blank_text_message_content = TextMessage.create()
    expect { blank_text_message_content.save! }.to raise_error 
    blank_text_message_content.errors.messages[:content].first.should == "can't be blank"
  end

  it "does delete the text_message if the associated user is deleted" do
    step = Step.create(description: "I will survive!")
    step_text_message = TextMessage.create(content: "We were on a break!")
    step.text_messages << step_text_message
    expect {step.destroy}.to_not change {TextMessage.count}
  end
end
