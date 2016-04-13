require "rails_helper"

RSpec.describe "get invoices index and show" do
  it "returns a list of all invoices" do
    create_invoices

    get "/api/v1/invoices"

    expect(response.status).to eq 200
    expect(json_body.count).to eq(3)

    invoice = json_body[0]

    expect(invoice).to eq ({
      "id" => 1,
      "customer_id" => 1,
      "merchant_id" => 1,
      "status" => "pending",
      "created_at"=> invoice["created_at"],
      "updated_at"=> invoice["updated_at"]
      })
  end

  it "returns a show of one invoice" do
    create_invoices

    get "/api/v1/invoices/2"

    expect(response.status).to eq 200

    invoice = json_body

    expect(invoice).to eq ({
      "id" => 2,
      "customer_id" => 2,
      "merchant_id" => 2,
      "status" => "pending",
      "created_at"=> invoice["created_at"],
      "updated_at"=> invoice["updated_at"]
      })
  end
end
