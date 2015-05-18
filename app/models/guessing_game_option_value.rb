class GuessingGameOptionValue < ActiveRecord::Base
  belongs_to :guessing_game_option
  has_many :guessing_game_instance_option_values
end