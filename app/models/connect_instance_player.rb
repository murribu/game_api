class ConnectInstancePlayer < ActiveRecord::Base
  belongs_to :connect_instance
  belongs_to :user
  has_many :connect_instance_state_bits
  has_many :connect_instance_moves
end