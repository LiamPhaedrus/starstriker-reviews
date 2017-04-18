class EditGames < ActiveRecord::Migration[5.0]
  def up
    remove_column :games, :average_rating
  end

  def down
    add_column :games, :average_rating, :string
  end
end
