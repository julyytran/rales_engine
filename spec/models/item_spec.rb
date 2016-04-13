require 'rails_helper'

RSpec.describe Item, type: :model do
  it "should return price in dollars" do
    item = Item.create(id: 1, name: "cool item", description: "coolest", unit_price: "77484", merchant_id: 1)
    expect(item.unit_price).to eq "774.84"
  end
end
