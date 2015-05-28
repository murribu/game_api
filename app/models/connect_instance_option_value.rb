class ConnectInstanceOptionValue < ActiveRecord::Base
  belongs_to :connect_instance
  belongs_to :connect_option_value
end