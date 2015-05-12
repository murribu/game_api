# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

o = OauthApplication.create(:name => 'Master', :secret => Rails.application.secrets[:mastersecret], :redirect_uri => 'http://corymmartin.com/callback_game.php')
o.oauth_access_tokens.create(:token => Rails.application.secrets[:mastertoken], :scope => 'master')