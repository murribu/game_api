o = OauthApplication.create(:name => 'Master', :secret => Rails.application.secrets[:mastersecret], :redirect_uri => 'http://corymmartin.com/callback_game.php')
o.oauth_access_tokens.create(:token => Rails.application.secrets[:mastertoken], :scope => 'master')
u = User.create(:email => Rails.application.secrets[:defaultemail], :password => Rails.application.secrets[:defaultpassword], :password_confirmation => Rails.application.secrets[:defaultpassword])

g = GuessingGame.create(:name => "Guess the number")
o = g.guessing_game_options.create(:name => "Highest Number", :option_type => "Integer")
o.guessing_game_option_values.create(:value => 10)
o.guessing_game_option_values.create(:value => 20)
o.guessing_game_option_values.create(:value => 30)
