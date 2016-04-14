require 'rails_helper'

RSpec.describe Invoice, type: :model do
  include Helpers

  it { should validate_presence_of :id }
  it { should validate_presence_of :customer_id }
  it { should validate_presence_of :merchant_id }
  it { should validate_presence_of :status }

  it { should belong_to(:merchant) }
  it { should belong_to(:customer) }

  it { should have_many(:items) }
  it { should have_many(:transactions) }

  it "returns pending invoices" do
    create_test_data

    expect(Invoice.count).to eq 3
    expect(Invoice.pending.count).to eq 1
  end

  it "returns successful invoices" do
    create_test_data

    expect(Invoice.count).to eq 3
    expect(Invoice.successful.count).to eq 2
  end
end
