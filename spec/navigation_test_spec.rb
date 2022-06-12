require_relative "../test/test_helper"

RSpec.describe 'Navigation', type: :system do
  it 'redirects to admin flights' do
    visit '/admin/flights'
    expect(page).to have_content('Flights')
  end

  it 'redirects and show stats' do
    visit '/admin/flights'
    expect(page).to (have_content('Total Reservations') && 
      have_content('Total Users') && have_content('Total Flights'))
  end

  it 'redirects to admin adding new flight' do
    visit '/admin/flights/new'
    expect(page).to have_content('New Flight')
  end


  it 'redirects to admin reservations' do
    visit '/admin/reservations'
    expect(page).to have_content('Reservations')
  end
end