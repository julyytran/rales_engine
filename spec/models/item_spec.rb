require 'rails_helper'

RSpec.describe Item, type: :model do
  it { should validate_presence_of :id }
  it { should validate_presence_of :name }
  it { should validate_presence_of :description }
  it { should validate_presence_of :unit_price }
  it { should validate_presence_of :merchant_id }

  it "should return the formatted price" do
    item = Item.create(id: 1, name: "Cool item", description: "so cool", unit_price: "1000", merchant_id: 1)

    expect(item.unit_price).to eq("10.00")
  end
end
