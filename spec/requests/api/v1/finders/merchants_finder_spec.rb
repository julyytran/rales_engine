require "rails_helper"

RSpec.describe "get merchants find and find all" do
  it "can find one merchant by id" do
    create_merchants

    get "/api/v1/merchants/find?id=2"

    expect(response.status).to eq 200

    merchant = json_body

    expect(merchant).to eq ({
      "id" => 2,
      "name" => "July's dope goods",
      "created_at"=> merchant["created_at"],
      "updated_at"=> merchant["updated_at"]
      })
  end

  it "can find one merchant by name" do
    create_merchants

    get "/api/v1/merchants/find?name=July's dope goods"

    expect(response.status).to eq 200

    merchant = json_body

    expect(merchant).to eq ({
      "id" => 2,
      "name" => "July's dope goods",
      "created_at"=> merchant["created_at"],
      "updated_at"=> merchant["updated_at"]
      })
  end

  it "can find one merchant by name case insensitive" do
    create_merchants

    get "/api/v1/merchants/find?name=july's DOPE GOODS"

    expect(response.status).to eq 200

    merchant = json_body

    expect(merchant).to eq ({
      "id" => 2,
      "name" => "July's dope goods",
      "created_at"=> merchant["created_at"],
      "updated_at"=> merchant["updated_at"]
      })
  end

  it "can find all merchants by name" do
    create_merchants

    get "/api/v1/merchants/find_all?name=july's awesome goods"

    expect(response.status).to eq 200

    merchant = json_body[0]

    expect(merchant).to eq ({
      "id" => 1,
      "name" => "July's awesome goods",
      "created_at"=> merchant["created_at"],
      "updated_at"=> merchant["updated_at"]
      })
  end
end
