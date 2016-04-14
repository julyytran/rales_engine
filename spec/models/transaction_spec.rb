require 'rails_helper'
require 'spec_helper'

RSpec.describe Transaction, type: :model do
  include Helpers
  
  it { should validate_presence_of :id }
  it { should validate_presence_of :invoice_id }
  it { should validate_presence_of :credit_card_number }
  it { should validate_presence_of :result }

  it { should belong_to(:invoice) }

  it "returns successful transactions" do
    create_test_data

    expect(Transaction.count).to eq 3
    expect(Transaction.successful.count).to eq 2
  end
end
