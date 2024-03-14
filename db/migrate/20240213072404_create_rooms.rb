class CreateRooms < ActiveRecord::Migration[6.0]
  def change
    create_table :rooms do |t|
      t.string :room_name
      t.boolean :is_private, default: false

      t.timestamps
    end
  end
end
