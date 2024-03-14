class ChangeColumnOfProfile < ActiveRecord::Migration[6.0]
  def change
    remove_column :profiles, :profile_picture, :string
  end
end
