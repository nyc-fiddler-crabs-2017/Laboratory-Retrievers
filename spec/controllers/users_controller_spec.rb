require 'rails_helper'

describe "UserController" do
  let!(:user) {User.create!(first_name: "Alex", last_name: "Hill", username: "alexhill", email: "alex@hill.com", password: "password")}


  describe "GET#login" do
    it "responds with status code 200" do
      get :login
      expect(response).to have_http_status 200
    end
  end

    it "renders the :login template" do

    end




end
