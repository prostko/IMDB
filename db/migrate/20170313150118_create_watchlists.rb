class CreateWatchlists < ActiveRecord::Migration[5.0]
  def change
    create_table :watchlists do |t|
      t.references :user, null: false
      t.references :movie, null: false

      t.timestamps
    end
  end
end
