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

  it "bills" do
    expect(Payment).to receive(:bill)
    subject
  end

  it "pays when started" do
    expect(Payment).to receive(:pay)
    subject.start
  end

  it "reimburses when cancelled" do
    expect(Payment).to receive(:reimburse)
    subject.cancel
  end

  it "logs state change to console" do
    expect(Rails.logger).to receive(:info).with(/^(?=.*\b(created)\b)(?=.*?\b(started)\b).*/)
    subject.start
  end

  it "publishes state change to rabbitmq" do
    expect(Publisher).to receive(:publish).with('trips', {type: "Trip", id: subject.id, from_state: :created, to_state: :started})
    subject.start
  end

  context "initialized with started state" do
    subject { Trip.create(aasm_state: "started") }
    it { is_expected.to be_started }

    it "can be canceled" do
      expect(subject.may_cancel?).to be true
      subject.cancel
      is_expected.to be_cancelled
    end

    it "reimburses when cancelled" do
      expect(Payment).to receive(:reimburse)
      subject.cancel
    end

    it "does not pays" do
      expect(Payment).to_not receive(:pay)
      subject
    end
  end

  context "initialized with cancelled state" do
    subject { Trip.create(aasm_state: "cancelled") }
    it { is_expected.to be_cancelled }

    it "cannot be started" do
      expect(subject.may_start?).to be false
      expect { subject.start }.to raise_error AASM::InvalidTransition
    end

    it "does not reimburses" do
      expect(Payment).to_not receive(:reimburse)
      subject
    end
  end
end
