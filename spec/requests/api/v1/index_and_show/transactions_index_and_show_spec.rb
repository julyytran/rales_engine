require "rails_helper"

RSpec.describe "get transactions index and show" do
  it "returns a list of all transactions" do
    create_test_data

    get "/api/v1/transactions"

    expect(response.status).to eq 200
    expect(json_body.count).to eq(3)

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

  it "returns a show of one transaction" do
    create_test_data

    get "/api/v1/transactions/2"

    expect(response.status).to eq 200

    transaction = json_body

    expect(transaction).to eq ({
      "id" => 2,
      "invoice_id" => 2,
      "credit_card_number" => "4654405418249631",
      "result" => "success",
      "created_at"=> transaction["created_at"],
      "updated_at"=> transaction["updated_at"]
      })
  end
end
