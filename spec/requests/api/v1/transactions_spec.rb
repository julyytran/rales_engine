require "rails_helper"

RSpec.describe "GET /api/v1/transactions" do
  it "returns a list of all transactions" do
    create_transactions

    get "/api/v1/transactions"

    expect(response.status).to eq 200
    expect(json_body.count).to eq(3)

    transaction = json_body[0]

    expect(transaction).to eq ({
      "id" => 1,
      "invoice_id" => 1,
      "credit_card_number" => "4654405418249632",
      "result" => "success"
      })
  end

  it "returns a show of one transaction" do
    create_transactions

    get "/api/v1/transactions/2"

    expect(response.status).to eq 200

    transaction = json_body

    expect(transaction).to eq ({
      "id" => 2,
      "invoice_id" => 2,
      "credit_card_number" => "4654405418249631",
      "result" => "success"
      })
  end
end
