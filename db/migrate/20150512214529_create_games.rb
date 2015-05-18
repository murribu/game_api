class CreateGames < ActiveRecord::Migration
  def change
    create_table :guessing_games do |t|
      t.string    :name,  :null => false
      t.timestamps
    end
    create_table :guessing_game_options do |t|
      t.references  :guessing_game, index: true, :null => false
      t.string      :name
      t.string      :type, :null => false
    end
    create_table :guessing_game_option_values do |t|
      t.references  :guessing_game_option, index: true, :null => false
      t.string      :value
    end
  end
end
