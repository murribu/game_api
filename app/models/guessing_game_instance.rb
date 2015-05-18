class GuessingGameInstance < ActiveRecord::Base
  belongs_to :guessing_game
  belongs_to :user
  has_many :guessing_game_instance_option_values
end