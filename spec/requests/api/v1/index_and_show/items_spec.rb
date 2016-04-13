require "rails_helper"

RSpec.describe "get items index and show" do
  it "returns a list of all items" do
    create_test_data

    get "/api/v1/items"

    expect(response.status).to eq 200
    expect(json_body.count).to eq(3)

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

  it "returns a show of one item" do
    create_test_data

    get "/api/v1/items/2"

    expect(response.status).to eq 200

    item = json_body

    expect(item).to eq ({
      "id" => 2,
      "name" => "Dope item",
      "description" => "so dope",
      "unit_price" => "10.00",
      "merchant_id" => 2,
      "created_at"=> item["created_at"],
      "updated_at"=> item["updated_at"]
      })
  end
end
