require 'spec_helper'

shared_context "with a user" do 
  let!(:user) {User.create(email: "cory@awesomeness.com", password: "password1", password_confirmation: "password1")}
end

describe V1::SessionsController do
  describe "POST '/v1/login'" do
    include_context "with a user"
    context "with correct credentials" do 
      context "with no auth token" do
        it "returns a 401" do
          post :create, email: "cory@awesomeness.com", password: "password1"
          expect(response.status).to eq(401)
        end
      end
      context "with valid auth token" do
        it "returns a 200" do
          request.env['HTTP_AUTHORIZATION'] = Rails.application.secrets[:mastertoken]
          post :create, {email: "cory@awesomeness.com", password: "password1"}
          expect(response.status).to eq(200)
        end
      end
    end
  end
end