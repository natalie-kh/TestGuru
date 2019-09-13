class CreateTestStatuses < ActiveRecord::Migration[6.0]
  def change
    create_table :test_statuses do |t|
      t.string :title, null: false

      t.timestamps
    end
  end
end
