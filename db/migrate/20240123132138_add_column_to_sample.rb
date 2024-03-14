class AddColumnToSample < ActiveRecord::Migration[6.0]
  def change
    add_column :samples, :expdate, :datetime
  end
end
