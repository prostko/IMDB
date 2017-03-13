class CreateWatchLists < ActiveRecord::Migration[5.0]
  def change
    create_table :watch_lists do |t|
    t.references :user, null: false
    t.references :movie, null: false

      t.timestamps
    end
  end
end
