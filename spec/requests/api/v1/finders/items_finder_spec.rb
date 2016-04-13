require "rails_helper"

RSpec.describe "get items find and find all" do
  it "can find one item by id" do
    create_test_data

    get "/api/v1/items/find?id=2"

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

  it "can find all items by name" do
    create_test_data

    get "/api/v1/items/find_all?name=cool item"

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
end
