class OptionValue < ActiveRecord::Base
  belongs_to :option
  has_many :game_instance_option_values
end