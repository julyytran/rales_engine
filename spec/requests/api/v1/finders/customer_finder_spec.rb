require "rails_helper"

RSpec.describe "get customers find and find all" do
  it "can find one customer by id" do
    create_customers

    get "/api/v1/customers/find?id=2"

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

  it "can find one customer by first name" do
    create_customers

    get "/api/v1/customers/find?first_name=July"

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

  it "can find one customer by first name case insensitive" do
    create_customers

    get "/api/v1/customers/find?first_name=JULY"

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

  it "can find one customer by last name case insensitive" do
    create_customers

    get "/api/v1/customers/find?last_name=Cool"

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

  it "can find all customers by name" do
    create_customers

    get "/api/v1/customers/find_all?name=july"

    expect(response.status).to eq 200

    customer = json_body[0]

    expect(customer).to eq ({
      "id" => 1,
      "first_name" => "July",
      "last_name" => "Cool",
      "created_at"=> customer["created_at"],
      "updated_at"=> customer["updated_at"]
      })
  end
end
