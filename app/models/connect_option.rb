class ConnectOption < ActiveRecord::Base
  has_many :connect_option_values
  has_many :connect_instance_option_values
end