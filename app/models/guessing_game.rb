class GuessingGame < ActiveRecord::Base
  has_many :guessing_game_options
  has_many :guessing_game_instances
end