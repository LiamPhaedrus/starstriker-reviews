require "rails_helper"

# [] Visiting the `/games` path should contain a list of games.
# [] Visiting the `/games/10` path should show the game details for a game with the ID of 10.
# [] Visiting the root path should display a list of all games.

feature "visitor sees games" do
  scenario "sees a list of games on index page" do
    chrono_trigger = Game.create(title: 'Chrono Trigger', description: "It's an awesome game", platform: "SNES")
    pong = Game.create(title: 'Pong', description: 'You hit a dot back and forth', platform: 'Arcade', release_year: '1972')

    visit games_path

    expect(page).to have_content "Chrono Trigger"
    expect(page).to have_link "Pong"

    visit root_path

    expect(page).to have_content "Chrono Trigger"
    expect(page).to have_link "Pong"
  end
end
