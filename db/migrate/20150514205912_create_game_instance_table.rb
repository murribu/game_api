class CreateGameInstanceTable < ActiveRecord::Migration
  def change
    create_table :guessing_game_instance_tables do |t|
      t.references :guessing_game, index: true, :null => false
      t.references :user, index: true, :null => false
      t.timestamps
    end
    create_table :guessing_game_instance_option_values do |t|
      t.references  :guessing_game_instance,        index: {name: 'index_guessing_game_instance_option_values_to_instance'}, :null => false #default index name was too long
      t.references  :guessing_game_option_value,    index: {name: 'index_guessing_game_instance_option_values_to_option_values'}, :null => false
      t.timestamps
    end
    add_timestamps(:guessing_game_options)
    add_timestamps(:guessing_game_option_values)
  end
end
