class ConnectOptionValue < ActiveRecord::Base
  belongs_to :connect_option
  has_many :connect_instance_option_values
end