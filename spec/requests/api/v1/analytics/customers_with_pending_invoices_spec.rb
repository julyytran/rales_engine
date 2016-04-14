require "rails_helper"

RSpec.describe "it returns all customers with pending invoices for a merchant" do
  it "returns customers with pending invoices" do
    create_test_data

    get "/api/v1/merchants/3/customers_with_pending_invoices"

    expect(response.status).to eq 200

    customer = json_body[0]

    expect(customer).to eq ({
        "id" => 3,
        "first_name" => "July",
        "last_name" => "Awesome",
        "created_at" => customer["created_at"],
        "updated_at" => customer["updated_at"]
      })
  end
end
