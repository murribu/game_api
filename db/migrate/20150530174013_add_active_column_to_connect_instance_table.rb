class AddActiveColumnToConnectInstanceTable < ActiveRecord::Migration
  def change
    add_column :connect_instances, :active, :boolean
  end
end
