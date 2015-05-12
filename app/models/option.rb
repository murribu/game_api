class Option < ActiveRecord::Base
  belongs_to :game
  has_many :option_values
end