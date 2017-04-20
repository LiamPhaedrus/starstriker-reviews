class CreateReviews < ActiveRecord::Migration[5.0]
  def change
    create_table :reviews do |t|
      t.string :body
      t.integer :rating, null: false

      t.belongs_to :game, null: false
      t.belongs_to :user, null: false
      t.timestamps
    end
  end
end
