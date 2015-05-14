class GameInstance < ActiveRecord::Base
  belongs_to :game
  belongs_to :user
  has_many :game_instance_option_values
end