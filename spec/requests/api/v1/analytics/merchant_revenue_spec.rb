require "rails_helper"

RSpec.describe "it returns merchant revenue analytics" do
  it "returns revenue for one merchant" do
    create_test_data
    revenue = {"revenue"=>"12.34"}

    get "/api/v1/merchants/1/revenue"

    expect(json_body).to eq revenue
  end

  it "returns revenue for one merchant on a given date" do
    create_test_data
    date = "2012-03-16 11:55:05"
    revenue = {"revenue"=>"113.56"}

    get "/api/v1/merchants/2/revenue?date=#{date}"

    expect(json_body).to eq revenue
  end

  it "returns revenue for all merchants on a given date" do
    create_test_data
    date = "2012-03-16 11:55:05"
    revenue = {"total_revenue"=>"125.90"}

    get "/api/v1/merchants/revenue?date=#{date}"

    expect(json_body).to eq revenue
  end
end
