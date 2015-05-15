class ChangeGameInstanceTablesNames < ActiveRecord::Migration
  def change
    rename_table :game_instances, :guessing_game_instances
    rename_table :game_instance_option_values, :guessing_game_instance_option_values
  end
end
