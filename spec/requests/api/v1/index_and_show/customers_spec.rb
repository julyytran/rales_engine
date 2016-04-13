require "rails_helper"

RSpec.describe "get customers index and show" do
  it "returns a list of all customers" do
    create_customers

    get "/api/v1/customers"

    expect(response.status).to eq 200
    expect(json_body.count).to eq(3)

    customer = json_body[0]

    expect(customer).to eq ({
      "id" => 1,
      "first_name" => "July",
      "last_name" => "Cool",
      "created_at"=> customer["created_at"],
      "updated_at"=> customer["updated_at"]
      })
  end

  it "returns a show of one customer" do
    create_customers

    get "/api/v1/customers/2"

    expect(response.status).to eq 200

    customer = json_body

    expect(customer).to eq ({
      "id" => 2,
      "first_name" => "July",
      "last_name" => "Dope",
      "created_at"=> customer["created_at"],
      "updated_at"=> customer["updated_at"]
      })
  end
end
