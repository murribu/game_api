class ChangeGameInstanceTableName < ActiveRecord::Migration
  def change
    rename_table :game_instance_tables, :game_instances
  end
end
