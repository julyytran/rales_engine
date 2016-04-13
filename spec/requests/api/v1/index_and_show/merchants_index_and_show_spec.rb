require "rails_helper"

RSpec.describe "get merchants index and show" do
  it "returns a list of all merchants" do
    create_merchants

    get "/api/v1/merchants"

    expect(response.status).to eq 200
    expect(json_body.count).to eq(3)

    merchant = json_body[0]

    expect(merchant).to eq ({
      "id" => 1,
      "name" => "July's awesome goods",
      "created_at"=> merchant["created_at"],
      "updated_at"=> merchant["updated_at"]
      })
  end

  it "returns a show of one merchant" do
    create_merchants

    get "/api/v1/merchants/2"

    expect(response.status).to eq 200

    merchant = json_body

    expect(merchant).to eq ({
      "id" => 2,
      "name" => "July's dope goods",
      "created_at"=> merchant["created_at"],
      "updated_at"=> merchant["updated_at"]
      })
  end
end
