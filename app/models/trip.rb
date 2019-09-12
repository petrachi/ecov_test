class Trip < ApplicationRecord
  include AASM

  has_secure_token

  def self.generate_unique_secure_token
    SecureRandom::base58(4)
  end

  def to_param
    token
  end

  aasm do
    state :created, initial: true, after_enter: :bill
    state :started, after_enter: :pay
    state :cancelled, after_enter: :reimburse

    after_all_transitions :log_status_change

    event :start do
      transitions from: :created, to: :started
    end

    event :cancel do
      transitions from: :created, to: :cancelled
    end
  end

  delegate :bill, :reimburse, :pay, to: Payment

  def log_status_change
    logger.info "#{ self.class} ##{ id } changing from #{aasm.from_state} to #{aasm.to_state} (event: #{aasm.current_event})"
  end
end
