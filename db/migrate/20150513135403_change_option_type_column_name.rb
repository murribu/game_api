class ChangeOptionTypeColumnName < ActiveRecord::Migration
  def change
    rename_column :options, :type, :option_type
  end
end
