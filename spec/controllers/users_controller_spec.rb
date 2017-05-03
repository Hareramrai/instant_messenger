require 'rails_helper'

RSpec.describe UsersController, type: :controller do

  let(:valid_attributes) {
    create(:dialect)
    attributes_for(:user, dialect_id: Dialect.last)
  }

  let(:invalid_attributes) {
    attributes_for(:user, username: '')
  }

  describe "GET #new" do
    it "assigns a new user as @user" do
      get :new, params: {}
      expect(assigns(:user)).to be_a_new(User)
    end
  end

  it do
    should permit(:username, :dialect_id).
      for(:create, params: { user: valid_attributes }).
      on(:user)
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new User" do
        expect {
          post :create, params: {user: valid_attributes}
        }.to change(User, :count).by(1)
      end

      it "assigns a newly created user as @user" do
        post :create, params: {user: valid_attributes}
        expect(assigns(:user)).to be_a(User)
        expect(assigns(:user)).to be_persisted
      end

      it "session has to be set for the user" do 
        post :create, params: {user: valid_attributes}
        expect(session[:user_id]).to eq(assigns(:user).id)
      end

      it "redirects to the root_path" do
        post :create, params: {user: valid_attributes}
        expect(response).to redirect_to(root_path)
      end
    end

    context "with invalid params" do
      it "assigns a newly created but unsaved user as @user" do
        post :create, params: {user: invalid_attributes}
        expect(assigns(:user)).to be_a_new(User)
      end

      it "re-renders the 'new' template" do
        post :create, params: {user: invalid_attributes}
        expect(response).to render_template("new")
      end
    end
  end

end
