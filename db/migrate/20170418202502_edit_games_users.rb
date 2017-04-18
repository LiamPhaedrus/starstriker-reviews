class EditGamesUsers < ActiveRecord::Migration[5.0]
  def change
    remove_column :games, :user_id, :string, null: false
    add_column :games, :user_id, :integer, null: false
  end
end
