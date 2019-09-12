require 'rails_helper'

RSpec.describe Payment do
  it { is_expected.to respond_to(:bill) }
  it { is_expected.to respond_to(:reimburse) }
  it { is_expected.to respond_to(:pay) }
end
