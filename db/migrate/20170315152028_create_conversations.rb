class CreateConversations < ActiveRecord::Migration[5.0]
  def change
    create_table :conversations do |t|
      t.string :content, null: false
      t.references :comment, null: false
      t.references :user, null: false

      t.timestamps
    end
  end
end
