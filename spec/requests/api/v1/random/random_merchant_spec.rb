require "rails_helper"

RSpec.describe "get random merchant" do
  it "returns a random merchant" do
    create_merchants

    get "/api/v1/merchants/random"

    expect(response.status).to eq 200

    merchant = json_body

    expect(merchant).to eq ({
      "id" => merchant["id"],
      "name" => merchant["name"],
      "created_at"=> merchant["created_at"],
      "updated_at"=> merchant["updated_at"]
      })
  end
end
