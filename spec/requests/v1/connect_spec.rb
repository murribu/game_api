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

describe "Playing a Connect Game" do
  let!(:user) {User.create(email: "cory@awesomeness.com", password: "password1", password_confirmation: "password1")}

  before do
    @user_auth_token = retrieve_access_token
    @ci_id = retrieve_connect_instance_id(@user_auth_token)
  end
  
  describe "Making an invalid move" do
    it "returns a 403" do
      post_with_token "/v1/connect_instances/#{@ci_id}/move", { 'x' => 999 }, {'Authorization' => @user_auth_token}
      expect(response.status).to eq(403)
    end
  end
end