class GuessingGameInstanceOptionValue < ActiveRecord::Base
  belongs_to :guessing_game_instance
  belongs_to :guessing_game_option_value
end