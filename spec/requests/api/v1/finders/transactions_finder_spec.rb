require "rails_helper"

RSpec.describe "get transactions find and find all" do
  it "can find one transaction by id" do
    create_transactions

    get "/api/v1/transactions/find?id=2"

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

  it "can find all transactions by result" do
    create_transactions

    get "/api/v1/transactions/find_all?result=success"

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
