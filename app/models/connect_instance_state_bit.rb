class ConnectInstanceStateBit < ActiveRecord::Base
  belongs_to :connect_instance
  belongs_to :connect_player
end