o = OauthApplication.create(:name => 'Master', :secret => Rails.application.secrets[:mastersecret], :redirect_uri => 'http://corymmartin.com/callback_game.php')
o.oauth_access_tokens.create(:token => Rails.application.secrets[:mastertoken], :scope => 'master')
u = User.create(:email => Rails.application.secrets[:defaultemail], :password => Rails.application.secrets[:defaultpassword], :password_confirmation => Rails.application.secrets[:defaultpassword])

g = Game.create(:name => "Guess the number")
o = g.options.create(:name => "Highest Number", :type => "Integer")
o.create(:value => 10)
o.create(:value => 20)
o.create(:value => 30)
