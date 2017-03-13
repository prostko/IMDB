class CreateLikes < ActiveRecord::Migration[5.0]
  def change
    create_table :likes do |t|
      t.references :movie, null: false
      t.references :user, null: false 

      t.timestamps
    end
  end
end
