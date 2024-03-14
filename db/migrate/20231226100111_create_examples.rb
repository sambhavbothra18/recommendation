class CreateExamples < ActiveRecord::Migration[6.0]
  def change
    create_table :examples do |t|
      t.integer :age

      t.timestamps
    end
  end
end
