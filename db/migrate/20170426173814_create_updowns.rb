class CreateUpdowns < ActiveRecord::Migration[5.0]
  def change
    create_table :updowns do |t|
      t.belongs_to :user, null: false
      t.belongs_to :review, null: false
      t.boolean :vote

      t.timestamps
    end
  end
end
