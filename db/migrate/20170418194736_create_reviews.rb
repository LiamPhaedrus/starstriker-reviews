class CreateReviews < ActiveRecord::Migration[5.0]
  def change
    create_table :reviews do |t|
      t.text :body
      t.integer :rating, null: false
      t.integer :user_id, null: false
      t.integer :upvotes
      t.integer :downvotes

      t.belongs_to :games, null: false
      t.timestamps
    end
  end
end
