class RemoveColumnsFromUsers < ActiveRecord::Migration[6.0]
  def up
    # Define how to remove the columns
    remove_column :users, :email
    remove_column :users, :encrypted_password
  end

  def down
    # Define how to revert the changes
    add_column :users, :email, :string
    add_column :users, :encrypted_password, :string
  end
end
