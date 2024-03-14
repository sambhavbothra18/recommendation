class CreateSamples < ActiveRecord::Migration[6.0]
  def change
    create_table :samples do |t|
      t.string :fullname
      t.string :first_name
      t.string :last_name

      t.timestamps
    end
  end
end
