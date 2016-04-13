require 'rails_helper'

RSpec.describe InvoiceItem, type: :model do
  it { should validate_presence_of :id }
  it { should validate_presence_of :item_id }
  it { should validate_presence_of :invoice_id }
  it { should validate_presence_of :quantity }
  it { should validate_presence_of :unit_price }

  it "should return the formatted price" do
    invoice_item = InvoiceItem.create(id: 1, item_id: 1, invoice_id: 1, quantity: 1, unit_price: "1234")

    expect(invoice_item.unit_price).to eq("12.34")
  end

end
