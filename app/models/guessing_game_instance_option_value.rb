class GuessingGameInstanceOptionValue < ActiveRecord::Base
  belongs_to :game_instance
  belongs_to :option_value
end