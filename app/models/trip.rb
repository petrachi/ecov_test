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

    after_all_transitions :log_status_change

    event :start do
      transitions from: :created, to: :started
    end

    event :cancel do
      transitions from: :created, to: :cancelled
    end
  end

  def log_status_change
    logger.info "#{ self.class} ##{ id } changing from #{aasm.from_state} to #{aasm.to_state} (event: #{aasm.current_event})"
  end
end
