class CreateGames < ActiveRecord::Migration
  def change
    create_table :games do |t|
      t.string    :name,  :null => false
      t.timestamps
    end
    create_table :options do |t|
      t.references  :game, index: true, :null => false
      t.string      :name
      t.string      :type, :null => false
    end
    create_table :option_values do |t|
      t.references  :option, index: true, :null => false
      t.string      :value
    end
  end
end
