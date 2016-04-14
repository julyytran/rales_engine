require "rails_helper"

RSpec.describe "merchants favorite customer" do
  it "returns customer with most successfl transactions for a merchant" do
    create_test_data

    get "/api/v1/merchants/1/favorite_customer"

    expect(response.status).to eq 200

    customer = json_body

    expect(customer).to eq ({
      "id" => 1,
      "first_name" => "July",
      "last_name" => "Cool",
      "created_at"=> customer["created_at"],
      "updated_at"=> customer["updated_at"]
      })
  end
end
