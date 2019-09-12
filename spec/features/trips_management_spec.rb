require "rails_helper"

RSpec.feature "Trips management", :type => :feature do
  scenario "User creates a new trip" do
    trip_count = Trip.count

    visit "/trips"

    expect(Payment).to receive(:bill)
    click_button "Créer un nouveau trajet"

    expect(Trip.count).to equal(trip_count + 1)
    expect(Trip.last).to be_created
  end

  scenario "User start a trip" do
    trip = Trip.create

    visit "/trips"

    click_link trip.token
    expect(page).to have_current_path(trip_path(trip))

    expect(Payment).to receive(:pay)
    click_button "Démarrer le trajet"

    expect(trip.reload).to be_started
  end

  scenario "User cancel a trip" do
    trip = Trip.create

    visit "/trips"

    click_link trip.token
    expect(page).to have_current_path(trip_path(trip))

    expect(Payment).to receive(:reimburse)
    click_button "Annuler le trajet"

    expect(trip.reload).to be_cancelled
  end

  scenario "User deletes a trip" do
    trip = Trip.create
    trip_count = Trip.count

    visit "/trips/#{trip.token}"

    click_button "Supprimer le trajet"
    expect(Trip.count).to equal(trip_count - 1)
  end
end
