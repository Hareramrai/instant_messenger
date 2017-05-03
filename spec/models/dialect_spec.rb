require 'rails_helper'

RSpec.describe Dialect, type: :model do
  subject {
    build(:dialect)
  }
  it "is valid with valid attributes" do
    expect(subject).to be_valid
  end

  it "is not valid without a name" do 
    subject.name = nil
    expect(subject).to_not be_valid
  end

  it "is not valid without a code" do 
    subject.code = nil
    expect(subject).to_not be_valid
  end

  context 'associations' do
    it { should have_many(:users) }
  end
  
end
