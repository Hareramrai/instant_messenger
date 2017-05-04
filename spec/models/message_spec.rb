require 'rails_helper'

RSpec.describe Message, type: :model do
  subject {
    build(:message)
  }
  context "validations" do 
    it { should validate_presence_of(:body) }
  end

  context 'associations' do
    it { should belong_to(:dialect) }
    it { should belong_to(:user) }
  end

  it { should delegate_method(:username).to(:user) }
  it { should delegate_method(:code).to(:dialect) }

  context ".translator_image" do
    it "returns a image name of current translator" do 
      expect(subject.translator_image).to eq('yoda.png')
    end
  end

  it "translate the message to the select dialect type" do
    message = create(:message, :binary_message, body: "a")
    expect(message.body).to eq('1100001')
  end
end
