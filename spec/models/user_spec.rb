require 'rails_helper'

RSpec.describe User, type: :model do
  subject {
    build(:user)
  }
  context "validations" do 
    it { should validate_presence_of(:username) }
    it { should validate_uniqueness_of(:username).ignoring_case_sensitivity }
  end

  context 'associations' do
    it { should belong_to(:dialect) }
  end

  it { should delegate_method(:name).to(:dialect).with_prefix(true) }
end
