require "rails_helper"

RSpec.describe "customer relationships" do
  it "returns associated invoices" do
    create_test_data

    get "/api/v1/customers/1/invoices"

    expect(response.status).to eq 200

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

  it "returns associated transactions" do
    create_test_data

    get "/api/v1/customers/1/transactions"

    expect(response.status).to eq 200

    transaction = json_body[0]

    expect(transaction).to eq ({
      "id" => 1,
      "invoice_id" => 1,
      "credit_card_number" => "4654405418249632",
      "result" => "success",
      "created_at"=> transaction["created_at"],
      "updated_at"=> transaction["updated_at"]
      })
  end
end
