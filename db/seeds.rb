o = OauthApplication.create(:name => 'Master', :secret => Rails.application.secrets[:mastersecret], :redirect_uri => 'http://corymmartin.com/callback_game.php')
o.oauth_access_tokens.create(:token => Rails.application.secrets[:mastertoken], :scope => 'master')
u = User.create(:email => Rails.application.secrets[:defaultemail], :password => Rails.application.secrets[:defaultpassword], :password_confirmation => Rails.application.secrets[:defaultpassword])

g = Game.create(:name => "Guess the number")
o = g.options.create(:name => "Highest Number", :option_type => "Integer")
o.option_values.create(:value => 10)
o.option_values.create(:value => 20)
o.option_values.create(:value => 30)
