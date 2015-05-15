class AddDefaultColumnToOptionValues < ActiveRecord::Migration
  def change
    add_column :option_values, :is_default, :boolean
  end
end
