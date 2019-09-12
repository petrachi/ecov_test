require 'rails_helper'

RSpec.describe Trip, type: :model do
  subject { Trip.create }

  it { is_expected.to be_valid }
  it { is_expected.to be_created }

  it "has a token" do
    expect(subject.token).to be
  end

  it "has a four-long character token" do
    expect(subject.token.size).to equal(4)
  end

  it "has a unique token" do
    expect { Trip.create(token: subject.token) }.to raise_error ActiveRecord::RecordNotUnique
  end

  it "can be started" do
    expect(subject.may_start?).to be true
    subject.start
    is_expected.to be_started
  end

  it "can be canceled" do
    expect(subject.may_cancel?).to be true
    subject.cancel
    is_expected.to be_cancelled
  end

  it "logs state change" do
    expect(Rails.logger).to receive(:info).with(/^(?=.*\b(created)\b)(?=.*?\b(started)\b).*/)
    subject.start
  end

  context "subject is started" do
    subject { Trip.create(aasm_state: "started") }
    it { is_expected.to be_started }

    it "cannot be canceled" do
      expect(subject.may_cancel?).to be false
      expect { subject.cancel }.to raise_error AASM::InvalidTransition
    end
  end

  context "subject is cancelled" do
    subject { Trip.create(aasm_state: "cancelled") }
    it { is_expected.to be_cancelled }

    it "cannot be started" do
      expect(subject.may_start?).to be false
      expect { subject.start }.to raise_error AASM::InvalidTransition
    end
  end
end
