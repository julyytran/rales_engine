require "rails_helper"

RSpec.describe "merchant relationships " do
  it "returns associated items" do
    create_test_data

    get "/api/v1/merchants/1/items"

    expect(response.status).to eq 200

    item = json_body[0]

    expect(item).to eq ({
      "id" => 1,
      "name" => "Cool item",
      "description" => "so cool",
      "unit_price" => "10.00",
      "merchant_id" => 1,
      "created_at"=> item["created_at"],
      "updated_at"=> item["updated_at"]
      })
  end

  it "returns associated invoices" do
    create_test_data

    get "/api/v1/merchants/1/invoices"

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
end
