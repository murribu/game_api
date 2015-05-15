class CreateGameInstanceTable < ActiveRecord::Migration
  def change
    create_table :game_instance_tables do |t|
      t.references :game, index: true, :null => false
      t.references :user, index: true, :null => false
      t.timestamps
    end
    create_table :game_instance_option_values do |t|
      t.references  :game_instance,  index: true, :null => false
      t.references  :option_value,   index: true, :null => false
      t.timestamps
    end
    add_timestamps(:options)
    add_timestamps(:option_values)
  end
end
