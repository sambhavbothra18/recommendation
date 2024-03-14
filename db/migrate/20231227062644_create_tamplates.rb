class CreateTamplates < ActiveRecord::Migration[6.0]
  def change
    create_table :tamplates do |t|
      t.string :name
      t.string :discription

      t.timestamps
    end
  end
end
