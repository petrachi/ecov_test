class TripsController < ApplicationController
  def index
    trips = Trip.order(:id)
    render :index, locals: {trips: trips}
  end

  def show
    trip = find_trip
    render :show, locals: {trip: trip}
  end

  def create
    trip = Trip.create
    redirect_to trip
  end

  def transition
    trip = find_trip
    trasition_exists? && trip.aasm.fire!(params[:transition])
    redirect_back(fallback_location: trip)
  end

  def destroy
    trip = find_trip
    trip.destroy!
    redirect_to action: :index
  end

  protected def find_trip
    Trip.find_by(token: params[:token])
  end

  protected def trasition_exists?
    Trip.aasm.events.map(&:name).map(&:to_s).include?(params[:transition])
  end
end
