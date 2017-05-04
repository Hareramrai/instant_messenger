require 'rails_helper'

RSpec.describe MessagesController, type: :controller do

  let(:valid_attributes) {
    dialect = create(:dialect)
    user = create(:user)
    session[:user_id] = user.id
    attributes_for(:message, dialect_id: dialect.id, user_id: user.id)
  }

   let(:invalid_attributes) {
    attributes_for(:message)
  }

  describe "GET #index" do
    it "assigns all messages as @messages" do
      message = Message.create! valid_attributes
      get :index, params: {}
      expect(assigns(:messages)).to eq([message])
      expect(assigns(:users)).to eq([User.last])
    end
  end

  it do
    should permit(:user_id, :dialect_id, :body).
      for(:create, params: { message: valid_attributes}).
      on(:message)
  end

  describe "POST #create" do
    it "creates a new Message" do
      expect {
        post :create, params: {message: valid_attributes}
      }.to change(Message, :count).by(1)
    end

    it "assigns a newly created message as @message" do
      post :create, params: {message: valid_attributes}
      expect(assigns(:message)).to be_a(Message)
      expect(assigns(:message)).to be_persisted
    end
  end

end
