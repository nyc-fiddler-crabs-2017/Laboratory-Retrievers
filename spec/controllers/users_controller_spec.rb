require 'rails_helper'


describe 'UsersController' do

  let!(:user) {User.create!(first_name: "Alex", last_name: "Hill", username: "alexhill", email: "alex@dbc.com", password: "password")}


  describe "GET#login" do
    it "responds with status code 200" do
      get :login
      expect(response).to have_http_status 200
    end

    it "renders the :login template" do
      get :login
      expect(response).to render_template(:login)
    end
  end

  describe "POST#login" do
    context "when valid params are passed" do
      it "responds with status code 200" do
        post :login, {user: {first_name: "Alex", last_name: "Hill", username: "alexhill", email: "alex@hill.com", password: "password"}}
        expect(response).to have_http_status 200
      end

      it "creates a new user in the database" do
        user = User.create!(first_name: "Alex", last_name: "Hill", username: "alexhill", email: "alex@hill.com", password: "password")
        expect(user).to eq User.last
      end

      it "assigns the newly created user as 'user'" do
        post :login, {user: {first_name: "Alex", last_name: "Hill", username: "alexhill", email: "alex@hill.com", password: "password"}}
        expect(assigns:(:user)). to eq User.last
      end

      it "redirects to the experiments index" do
        post :login, {user: {first_name: "Alex", last_name: "Hill", username: "alexhill", email: "alex@hill.com", password: "password"}}
        expect(response).to redirect_to(assigns(:user))
      end
    end

    context "when invalid params are passed" do
      it "responds with status code 422: Unprocessable Entity" do
          post :login, {user: {last_name: "Hill", username: "alexhill", email: "alex@hill.com", password: "password"}}
          expect(response).to have_http_status 422
      end

      it "does not create a new user in the database" do
          post :login, {user: {last_name: "Hill", username: "alexhill", email: "alex@hill.com", password: "password"}}
          expect(assigns(:user)).not_to be_persisted
      end

      it "renders the :login template" do
          post :login, {user: {last_name: "Hill", username: "alexhill", email: "alex@hill.com", password: "password"}}
          expect(response).to render_template(:login)
      end
    end

  end

end
