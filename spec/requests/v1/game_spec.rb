require 'spec_helper'

describe "Game Play" do
  let!(:user) {User.create(email: "cory@awesomeness.com", password: "password1", password_confirmation: "password1")}
  
  before do
    @user_auth_token = retrieve_access_token
  end

  describe "Instantiating a game" do
    it "returns game id" do
      post_with_token "/v1/guessing_games/1/start", {'options' => {'1' => '2'}}, {'Authorization' => @user_auth_token}
      expect(response.body).to match(/"id"/)
    end
    
    it "does not return the answer" do
      post_with_token "/v1/guessing_games/1/start", {'options' => {'1' => '2'}}, {'Authorization' => @user_auth_token}
      expect(response.body).to_not match(/"answer"/)
    end
  end

  describe "Making an incorrect guess" do
    it "returns 'incorrect'" do
      id = retrieve_guessing_game_instance_id(@user_auth_token)
      post_with_token "/v1/guessing_game_instances/1/guess/#{id}", {'guess' => 999}, {'Authorization' => @user_auth_token}
      expect(response.body).to match(/"incorrect"/)
    end
  end
end