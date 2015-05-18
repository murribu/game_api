class ChangeOptionTypeColumnName < ActiveRecord::Migration
  def change
    rename_column :guessing_game_options, :type, :option_type
  end
end
