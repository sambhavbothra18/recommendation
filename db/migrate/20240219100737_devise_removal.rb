class DeviseRemoval < ActiveRecord::Migration[6.0]
   def up
    remove_index :users, :reset_password_token

    remove_column :users, :reset_password_sent_at
    remove_column :users, :reset_password_token

    # Uncomment below if timestamps were not included in your original model.
    # remove_column :users, :created_at
    # remove_column :users, :updated_at
  end

  def down
    change_table :users do |t|

      t.datetime :reset_password_sent_at
      t.string   :reset_password_token

      # Uncomment below if timestamps were not included in your original model.
      # t.timestamps null: false
    end

    add_index :users, :reset_password_token, unique: true
  end
end
