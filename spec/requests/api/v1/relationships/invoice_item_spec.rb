require "rails_helper"

RSpec.describe "invoice item relations" do
  it "returns associated invoice" do
    create_test_data

    get "/api/v1/invoice_items/1/invoice"

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

  it "returns associated item" do
    create_test_data

    get "/api/v1/invoice_items/1/item"

    expect(response.status).to eq 200

    item = json_body

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
end
