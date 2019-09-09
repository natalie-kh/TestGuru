class AddLevelToTests < ActiveRecord::Migration[6.0]
  def change
    add_column :tests, :level, :integer, column_options: { null: 0}
  end
end
