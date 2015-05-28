class CreateConnectStructure < ActiveRecord::Migration
  def change
    create_table :connect_options do |t|
      t.string :name, null: false, default: ""
      t.string :option_type, null: false
    end
    create_table :connect_option_values do |t|
      t.references :connect_option, index: true, null: false
      t.string :value, null: false
      t.boolean :is_default
    end
    create_table :connect_instances do |t|
      t.references :user, index: true, null: false
    end
    create_table :connect_instance_option_values do |t|
      t.references :connect_option, index: true, null: false
      t.references :connect_instance, index: true, null: false
      t.string :value
    end
    create_table :connect_players do |t|
      t.references :connect_instance, index: true, null: false
      t.string :name
      t.boolean :winner
    end
    create_table :connect_instance_state_bits do |t|
      t.references :connect_instance, index: true, null: false
      t.integer :x
      t.integer :y
      t.integer :z
      t.references :connect_player
    end
  end
end
