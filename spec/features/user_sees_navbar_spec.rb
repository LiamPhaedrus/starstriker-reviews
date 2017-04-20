require "rails_helper"
# [] Navbar should be at the top of each page.
# [] Clicking home should send you to the '/' page.
feature "visitor sees a nav bar at the top of the page" do
  scenario "user sees nav bar at the top of the home page" do
    pong = Game.create(
      title: 'Pong', description: 'You hit a dot back and forth',
      platform: 'Arcade', release_year: '1972'
    )
    visit root_path
    click_link 'Home'

    expect(page).to have_content pong.title
    expect(page).to have_content("Starstriker's Retro Game Reviews!")
  end

  scenario "visits a specific game's path and still sees nav bar" do
    pong = Game.create(
      title: 'Pong', description: 'You hit a dot back and forth',
      platform: 'Arcade', release_year: '1972'
    )
    visit game_path(pong)
    click_link 'Home'

    expect(page).to have_content pong.title
    expect(page).to have_content("Starstriker's Retro Game Reviews!")
  end
end
