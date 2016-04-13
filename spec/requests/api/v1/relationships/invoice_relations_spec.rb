require "rails_helper"

RSpec.describe "invoice relations" do
  it "returns associated transactions" do
    create_test_data

    get "/api/v1/invoices/1/transactions"

    expect(response.status).to eq 200

    transaction = json_body[0]

    expect(transaction).to eq ({
      "id" => 1,
      "invoice_id" => 1,
      "credit_card_number" => "4654405418249632",
      "result" => "success",
      "created_at"=> transaction["created_at"],
      "updated_at"=> transaction["updated_at"]
      })
  end

  it "returns associated invoice items" do
    create_test_data

    get "/api/v1/invoices/1/invoice_items"

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

  it "returns associated items" do
    create_test_data

    get "/api/v1/invoices/1/items"

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

  it "returns associated customer" do
    create_test_data

    get "/api/v1/invoices/1/customer"

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

  it "returns associated merchant" do
    create_test_data

    get "/api/v1/invoices/1/merchant"

    merchant = json_body

    expect(merchant).to eq ({
      "id" => 1,
      "name" => "July's awesome goods",
      "created_at"=> merchant["created_at"],
      "updated_at"=> merchant["updated_at"]
      })
  end
end
