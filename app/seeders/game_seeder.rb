class GameSeeder
  GAMES = [
    {
      title: "Space Invaders",
      description: "The classic game of shooting aliens with lasers",
      release_year: "1978",
      platform: "Arcade"
    }, {
      title: "Pac-Man",
      description: "Eat the dots in the maze, but watch out for the ghosts!",
      release_year: "1980",
      platform: "Arcade"
    }, {
      title: "Ms. Pac-Man",
      description: "Even better than Pac-Man, navigate the maze without getting caught",
      release_year: "1982",
      platform: "Arcade"
    }, {
      title: "Super Mario Bros.",
      description: "A plumber fights random monsters to save the princess",
      release_year: "1985",
      platform: "NES"
    }, {
      title: "Metroid",
      description: "Great 2D action as you control Samus Aran throughout her adventures",
      release_year: "1986",
      platform: "NES"
    }, {
      title: "Tecmo Bowl",
      description: "First great football video game!",
      release_year: "1987",
      platform: "Arcade"
    }, {
      title: "The Legend of Zelda: A Link to the Past",
      description: "You are Link, the child who goes on to save his country and Princess Zelda",
      release_year: "1991",
      platform: "SNES"
    }, {
      title: "Sonic the Hedgehog",
      description: "Spin your way with speed throughout the fun levels",
      release_year: "1991",
      platform: "Sega Genesis"
    }
  ]
  def self.seed!
    GAMES.each do |game_params|
      title = game_params[:title]
      game = Game.find_or_initialize_by!(title: title)
      game.assign_attributes(game_params)
      game.save!
    end
  end
end
