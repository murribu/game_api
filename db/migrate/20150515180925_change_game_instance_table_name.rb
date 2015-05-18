class ChangeGameInstanceTableName < ActiveRecord::Migration
  def change
    rename_table :guessing_game_instance_tables, :guessing_game_instances
  end
end
