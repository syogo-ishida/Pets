class CreatePosts < ActiveRecord::Migration[5.2]
  def change
    create_table :posts do |t|
      t.integer :user_id, null: false
      t.string :image_id
      t.text :caption

      t.timestamps
    end
  end
end
