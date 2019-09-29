class ChangeUsersTableColumnNames < ActiveRecord::Migration[6.0]
  def up
    rename_column :users, :login, :email
    rename_column :users, :password, :password_digest
  end

  def down
    rename_column :users, :email, :login
    rename_column :users, :password_digest, :password
  end
end
