class CreateUserItemInteractions < ActiveRecord::Migration[6.0]
  def change
    create_table :user_item_interactions do |t|
      t.references :user, null: false, foreign_key: true
      t.references :item, null: false, foreign_key: true
      t.integer :rating

      t.timestamps
    end
  end
end
