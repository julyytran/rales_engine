require "rails_helper"

RSpec.describe "transactions relations" do
  it "returns associated invoice" do
    create_test_data

    get "/api/v1/transactions/1/invoice"

    expect(response.status).to eq 200

    invoice = json_body

    expect(invoice).to eq ({
      "id" => 1,
      "customer_id" => 1,
      "merchant_id" => 1,
      "status" => "pending",
      "created_at"=> invoice["created_at"],
      "updated_at"=> invoice["updated_at"]
      })
  end
end
