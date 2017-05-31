

describe UsersHelper do

  describe "current_user" do
    it "returns the user object of the user currently logged in" do
      user = User.create!(first_name: "Alex", last_name: "Hill", username: "alexhill", email: "alex@hill.com", password: "password")
      session[:user_id]= user.id
      expect(helper.current_user).to eq (user)
    end
  end

  describe "logged_in?" do
  end


end
