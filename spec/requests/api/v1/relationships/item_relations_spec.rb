require "rails_helper"

RSpec.describe "item relations" do
  it "returns associated invoice items" do
    create_test_data

    get "/api/v1/items/1/invoice_items"

    expect(response.status).to eq 200

    invoice_item = json_body[0]

    expect(invoice_item).to eq ({
      "id" => 1,
      "item_id" => 1,
      "invoice_id" => 1,
      "quantity" => 1,
       "unit_price" => "12.34",
       "created_at"=> invoice_item["created_at"],
       "updated_at"=> invoice_item["updated_at"]
      })
  end

  it "returns associated merchant" do
    create_test_data

    get "/api/v1/items/1/merchant"

    merchant = json_body

    expect(merchant).to eq ({
      "id" => 1,
      "name" => "July's awesome goods",
      "created_at"=> merchant["created_at"],
      "updated_at"=> merchant["updated_at"]
      })
  end
end
