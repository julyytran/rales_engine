require "rails_helper"

RSpec.describe "get invoice_items find and find all" do
  it "can find one invoice_item by id" do
    create_invoice_items

    get "/api/v1/invoice_items/find?id=2"

    expect(response.status).to eq 200

    invoice_item = json_body

    expect(invoice_item).to eq ({
      "id" => 2,
      "item_id" => 2,
      "invoice_id" => 2,
      "quantity" => 2,
       "unit_price" => "56.78",
       "created_at"=> invoice_item["created_at"],
       "updated_at"=> invoice_item["updated_at"]
      })
  end

  it "can find all invoice_items by status" do
    create_invoice_items

    get "/api/v1/invoice_items/find_all?status=pending"

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
end
