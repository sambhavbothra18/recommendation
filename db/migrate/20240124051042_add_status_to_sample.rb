class AddStatusToSample < ActiveRecord::Migration[6.0]
  def change
    add_column :samples, :status, :integer, default: 0
  end
end
