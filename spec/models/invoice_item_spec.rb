require 'rails_helper'

RSpec.describe InvoiceItem, type: :model do
  it "should return price in dollars" do
    iitem = InvoiceItem.create(id: 1, item_id: 1, invoice_id: 1, quantity: 1, unit_price: "77484")
    expect(iitem.unit_price).to eq "774.84"
  end
end
