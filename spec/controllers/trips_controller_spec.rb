require 'rails_helper'

RSpec.describe TripsController, type: :controller do
  render_views

  describe "GET index" do
    it "renders" do
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

  describe "DELETE destroy" do
    it "renders" do
      trip = Trip.create

      delete :destroy, params: { token: trip.token }
      expect(response).to be_redirect
    end
  end
end
