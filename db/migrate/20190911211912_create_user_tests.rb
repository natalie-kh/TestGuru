class CreateUserTests < ActiveRecord::Migration[6.0]
  def change
    create_table :user_tests do |t|
      t.references :user, foreign_key: true
      t.references :test, foreign_key: true
      t.references :test_status, foreign_key: true

      t.timestamps
    end
  end
end
