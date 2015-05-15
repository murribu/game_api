class AddAnswerToGuessingGameInstance < ActiveRecord::Migration
  def change
    add_column :guessing_game_instances, :answer, :integer
  end
end
