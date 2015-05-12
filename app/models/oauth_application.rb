class OauthApplication < ActiveRecord::Base
  validates_presence_of   :name, :secret, :redirect_uri
  validates_uniqueness_of :secret
  
  has_many :oauth_access_tokens
  
end