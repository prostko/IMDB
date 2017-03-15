class CreateComments < ActiveRecord::Migration[5.0]
  def change
    create_table :comments do |t|
      t.string :content, null: false
      t.references :movie, null: false
      t.references :user, null: false

      t.timestamps
    end
  end
end
