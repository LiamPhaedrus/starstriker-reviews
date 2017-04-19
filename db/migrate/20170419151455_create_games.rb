class CreateGames < ActiveRecord::Migration[5.0]
  def change
    create_table :games do |t|
      t.string :title, null: false
      t.string :description, null: false
      t.string :release_year
      t.string :platform, null: false

      t.timestamps
    end
  end
end
