require "rails_helper"

feature "visitor can search games" do
  scenario "user sees search" do
    visit root_path

    expect(page).to have_field('query')
    expect(page).to have_button('Search')
  end

  scenario "user searches for game and sees results" do
    first_game = FactoryGirl.create(:game)
    second_game = FactoryGirl.create(:game, title: "Whee")
    third_game = FactoryGirl.create(:game, title: "Bobby")
    fourth_game = FactoryGirl.create(:game)

    visit root_path

    fill_in 'query', with: second_game.title
    click_button 'Search'

    expect(page).to have_content("Whee")

    fill_in 'query', with: "Game"
    click_button 'Search'

    expect(page).to have_content(first_game.title)
    expect(page).to have_content(fourth_game.title)
  end
end
