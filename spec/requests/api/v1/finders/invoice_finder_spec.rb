require "rails_helper"

RSpec.describe "get invoices find and find all" do
  it "can find one invoice by id" do
    create_test_data

    get "/api/v1/invoices/find?id=2"

    expect(response.status).to eq 200

    invoice = json_body

    expect(invoice).to eq ({
      "id" => 2,
      "customer_id" => 2,
      "merchant_id" => 2,
      "status" => "pending",
      "created_at"=> invoice["created_at"],
      "updated_at"=> invoice["updated_at"]
      })
  end

  it "can find all invoices by status" do
    create_test_data

    get "/api/v1/invoices/find_all?stauts=pending"

    expect(response.status).to eq 200

    invoice = json_body[0]

    expect(invoice).to eq ({
      "id" => 1,
      "customer_id" => 1,
      "merchant_id" => 1,
      "status" => "pending",
      "created_at"=> invoice["created_at"],
      "updated_at"=> invoice["updated_at"]
      })
  end
end
