#----------OAuth init
o = OauthApplication.create(:name => 'Master', :secret => Rails.application.secrets[:mastersecret], :redirect_uri => 'http://corymmartin.com/callback_game.php')
o.oauth_access_tokens.create(:token => Rails.application.secrets[:mastertoken], :scope => 'master')
#----------User init
u = User.create(:email => Rails.application.secrets[:defaultemail], :password => Rails.application.secrets[:defaultpassword], :password_confirmation => Rails.application.secrets[:defaultpassword])
#----------Guessing Game init
g = GuessingGame.create(:name => "Guess the number")
o = g.guessing_game_options.create(:name => "Highest Number", :option_type => "Integer")
o.guessing_game_option_values.create(:value => 10, :is_default => true)
o.guessing_game_option_values.create(:value => 20)
o.guessing_game_option_values.create(:value => 30)
#----------Connect init
co = ConnectOption.create(:name => "Dimensions", :option_type => "integer")
co.connect_option_values.create(:value => 2, :is_default => true)
co.connect_option_values.create(:value => 3)
co = ConnectOption.create(:name => "Players", :option_type => "integer")
(1..4).each do |i|
  co.connect_option_values.create(:value => i)
end