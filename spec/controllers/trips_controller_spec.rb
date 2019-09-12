require 'rails_helper'

RSpec.describe TripsController, type: :controller do
  render_views

  describe "GET index" do
    it "renders" do
      Trip.create

      get :index
      expect(response).to be_success
    end
  end

  describe "GET show" do
    it "renders" do
      trip = Trip.create

      get :show, params: { token: trip.token }
      expect(response).to be_success
    end
  end

  describe "POST create" do
    it "renders" do
      post :create
      expect(response).to be_redirect
    end
  end

  describe "POST transition" do
    it "renders" do
      trip = Trip.create

      post :transition, params: { token: trip.token, transition: :start }
      expect(response).to be_redirect
    end

    it "doesn't update the trip if transition does not exist" do
      trip = Trip.create

      post :transition, params: { token: trip.token, transition: :not_implemented_transition }
      expect(response).to be_redirect
      expect(trip).to be_created
    end
  end

  describe "DELETE destroy" do
    it "renders" do
      trip = Trip.create

      delete :destroy, params: { token: trip.token }
      expect(response).to be_redirect
    end
  end
end
