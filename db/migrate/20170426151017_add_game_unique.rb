class AddGameUnique < ActiveRecord::Migration[5.0]
  def change
    add_index :games, :title, unique: true
  end
end
