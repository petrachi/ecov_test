class Trip < ApplicationRecord
  include AASM

  has_secure_token

  def self.generate_unique_secure_token
    SecureRandom::base58(4)
  end

  aasm do
    state :created, initial: true
    state :started
    state :cancelled

    event :start do
      transitions from: :created, to: :started
    end

    event :cancel do
      transitions from: :created, to: :cancelled
    end
  end
end
