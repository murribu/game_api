class GuessingGameOption < ActiveRecord::Base
  belongs_to :guessing_game
  has_many :guessing_game_option_values
end