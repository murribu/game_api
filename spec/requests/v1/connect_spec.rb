require 'spec_helper'

describe "Starting a Connect Game" do
  let!(:user) {User.create(email: "cory@awesomeness.com", password: "password1", password_confirmation: "password1")}
  
  before do
    @user_auth_token = retrieve_access_token
  end

  describe "Instatiating a game" do
    it "returns game id" do
      post_with_token "/v1/connect/start", {"options" => {"1" => "4", "2" => "7", "3" => "7", "4" => "1"}}, {'Authorization' => @user_auth_token}
      expect(response.body).to match(/"id"/)
    end
  end
end