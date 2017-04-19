require "rails_helper"
# [] Visiting the `/games` path should contain a list of games.
# [] Visiting the `/games/10` path should show the game details for a game with
#    the ID of 10.
feature "visitor sees game details" do
  scenario "clicks link from index page and goes to details page" do
    pong = Game.create(
      title: 'Pong', description: 'You hit a dot back and forth',
      platform: 'Arcade', release_year: '1972'
    )
    visit root_path
    click_link 'Pong'

    expect(page).to have_content pong.title
    expect(page).to have_content pong.description
    expect(page).to have_content pong.platform
    expect(page).to have_content pong.release_year
  end

  scenario "visits a specific game's path and shows only that game's details" do
    chrono_trigger = Game.create(
      title: 'Chrono Trigger',
      description: "It's an awesome game",
      platform: "SNES"
    )
    pong = Game.create(
      title: 'Pong', description: 'You hit a dot back and forth',
      platform: 'Arcade', release_year: '1972'
    )
    visit game_path(pong)

    expect(page).to have_content pong.title
    expect(page).to have_content pong.description
    expect(page).to_not have_content chrono_trigger.description
  end
end
