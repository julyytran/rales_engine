require "rails_helper"

RSpec.describe "GET /api/v1/invoices" do
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
      "status" => "pending"
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
      "status" => "pending"
      })
  end
end
