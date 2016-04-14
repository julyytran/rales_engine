require 'rails_helper'

RSpec.describe Merchant, type: :model do
  include Helpers

  it { should validate_presence_of :id }
  it { should validate_presence_of :name }

  it { should have_many(:items) }
  it { should have_many(:invoices) }

  it "returns revenue for one merchant" do
    create_test_data
    revenue = {"revenue"=>"12.34"}

    expect(Merchant.find(1).revenue).to eq revenue
  end

  it "returns revenue for one merchant for a given date" do
    create_test_data
    merchant = Merchant.find(2)
    revenue = {"revenue"=>"113.56"}

    expect(merchant.revenue("2012-03-16 11:55:05")).to eq revenue
  end

  it "returns revenue for all merchants for date" do
    create_test_data
    merchant = Merchant.find(3)
    revenue = {"total_revenue"=>"125.90"}

    expect(Merchant.all_revenue("2012-03-16 11:55:05")).to eq revenue
  end
end
