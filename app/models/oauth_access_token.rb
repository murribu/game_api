class OauthAccessToken < ActiveRecord::Base
  validates_uniqueness_of :token
  
  belongs_to :oauth_applications
  belongs_to :user
end