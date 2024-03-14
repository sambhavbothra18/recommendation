class AddColumnToStore < ActiveRecord::Migration[6.0]
  def change
    add_column :stores, :password_digest, :string
    add_column :stores, :body, :text
  end
end
