class Game < ActiveRecord::Base
  has_many :options
  has_many :game_instances
end