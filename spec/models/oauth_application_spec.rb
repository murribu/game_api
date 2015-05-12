require 'spec_helper'

describe OauthApplication do
  let (:app){ FactoryGirl.build(:oauth_application) }
  
  it "requires a unique secret" do
    expect(app).to validate_uniqueness_of(:secret)
  end
end