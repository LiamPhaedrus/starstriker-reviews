class GameSeeder
  def self.seed!
    Game.create!(title: "", description: "", release_year: "", platoform: "")
  end
end
