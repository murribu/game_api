class AddDefaultColumnToOptionValues < ActiveRecord::Migration
  def change
    add_column :guessing_game_option_values, :is_default, :boolean
  end
end
