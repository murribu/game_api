require 'spec_helper'

describe "Instantiating a game" do
  let!(:user) {User.create(email: "cory@awesomeness.com", password: "password1", password_confirmation: "password1")}
  
  before do
    @user_auth_token = retrieve_access_token
  end
  
  it "returns game info" do
    post_with_token "/v1/guessing_games/1/start", {'options' => {'1' => '2'}}, {'Authorization' => @user_auth_token}
    expect(response.body).to match(/"guessing_game_id"/)
  end
end