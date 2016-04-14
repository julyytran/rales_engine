require "rails_helper"

RSpec.describe "it returns a customers favorite merchant" do
  it "returns the merchant a customer frequents most" do
    create_test_data

    get "/api/v1/customers/1/favorite_merchant"

    expect(response.status).to eq 200

    merchant = json_body

    expect(merchant).to eq ({
      "id" => 1,
      "name" => "July's awesome goods",
      "created_at"=> merchant["created_at"],
      "updated_at"=> merchant["updated_at"]
      })
    end
end
