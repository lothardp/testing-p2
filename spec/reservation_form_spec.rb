require_relative "../test/test_helper"
require 'database_cleaner/active_record'

RSpec.describe 'Forms tests', type: :system do
  before do
    DatabaseCleaner.strategy = :transaction
    DatabaseCleaner.start
  end

  it 'creates a flight' do
    visit '/admin/flights'
    click_link "New flight"
    fill_in "Datetime", :with => DateTime.new(2023, 2, 21)
    fill_in "Origin", :with => "Santiago"
    fill_in "Destination", :with => "Guatemala"
    click_button "Create Flight"
    expect(page).to have_content("Flight was successfully created.")
  end

  it 'creates a reservation' do
    # crea un vuelo
    visit '/admin/flights'
    click_link "New flight"
    fill_in "Datetime", :with => DateTime.new(2023, 2, 21)
    fill_in "Origin", :with => "Santiago"
    fill_in "Destination", :with => "Guatemala"
    click_button "Create Flight"

    #crea una reserva para el vuelo
    visit '/flights'
    click_link "Reserve"
    fill_in "User", :with => "Luis Alberto Spinetta"
    fill_in "Seats", :with => "1A"
    click_button "Reserve"
    expect(page).to have_content("Reservation created")
  end

  it 'filters a user reservation' do
    # crea un vuelo
    visit '/admin/flights'
    click_link "New flight"
    fill_in "Datetime", :with => DateTime.new(2023, 2, 21)
    fill_in "Origin", :with => "Santiago"
    fill_in "Destination", :with => "Guatemala"
    click_button "Create Flight"

    # crea dos reservas distintas para el vuelo
    visit '/flights'
    click_link "Reserve"
    fill_in "User", :with => "Luis Alberto Spinetta"
    fill_in "Seats", :with => "1A"
    click_link_or_button "Reserve"

    click_link "Reserve"
    fill_in "User", :with => "Gustavo Cerati"
    fill_in "Seats", :with => "2A"
    click_link_or_button "Reserve"
    
    # filtra la reserva
    visit '/admin/reservations'
    fill_in "User", :with => "Luis Alberto Spinetta"
    click_link_or_button "Filter"
    expect(page).to have_content("Luis Alberto Spinetta")
      
  end

  after do
    DatabaseCleaner.clean
  end
end