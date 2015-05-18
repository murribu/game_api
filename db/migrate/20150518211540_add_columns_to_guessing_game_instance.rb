class AddColumnsToGuessingGameInstance < ActiveRecord::Migration
  def change
    add_column :guessing_game_instances, :answer, :integer
    add_column :guessing_game_instances, :active, :boolean
  end
end
