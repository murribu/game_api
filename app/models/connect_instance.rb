class ConnectInstance < ActiveRecord::Base
  belongs_to :user
  has_many :connect_instance_option_values
  has_many :connect_instance_moves
  has_many :connect_instance_state_bits
end