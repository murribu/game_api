require 'spec_helper'

describe "Starting a Guessing Game" do
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
end
  
describe "Playing a Guessing Game" do
  let!(:user) {User.create(email: "cory@awesomeness.com", password: "password1", password_confirmation: "password1")}
  
  before do
    @user_auth_token = retrieve_access_token
    @ggi_id = retrieve_guessing_game_instance_id(@user_auth_token)
  end
  
  
  describe "Making an incorrect guess" do
    it "returns 'incorrect'" do
      post_with_token "/v1/guessing_game_instances/#{@ggi_id}/guess/", {'guess' => 999}, {'Authorization' => @user_auth_token}
      expect(response.body).to match(/"incorrect"/)
    end
  end
    
  describe "When using the Master Token, Requesting the answer" do
    it "returns the answer" do
      get_with_token "/v1/guessing_game_instances/#{@ggi_id}/answer", {}, {'Authorization' => Rails.application.secrets[:mastertoken]}
      ggi = GuessingGameInstance.find(@ggi_id)
      expect(response.body).to match(/"answer"/)
    end
  end
  
  describe "Making a correct guess" do
    before do
      ggi = GuessingGameInstance.find(@ggi_id)
      post_with_token "/v1/guessing_game_instances/#{@ggi_id}/guess/", {'guess' => ggi.answer}, {'Authorization' => @user_auth_token}
    end
    it "returns 'correct'" do
      expect(response.body).to match(/"correct"/)
    end
    
    it "marks the game as inactive" do
      ggi = GuessingGameInstance.find(@ggi_id)
      expect(ggi.active).to be(false)
    end
  end
end