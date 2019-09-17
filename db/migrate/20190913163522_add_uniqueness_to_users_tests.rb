class AddUniquenessToUsersTests < ActiveRecord::Migration[6.0]
  def change
    add_index :tests_users, [:user_id, :test_id], unique: true
  end
end
