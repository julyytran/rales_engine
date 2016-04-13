require 'rails_helper'

RSpec.describe InvoiceItem, type: :model do
  it { should validate_presence_of :id }
  it { should validate_presence_of :item_id }
  it { should validate_presence_of :invoice_id }
  it { should validate_presence_of :quantity }
  it { should validate_presence_of :unit_price }

  it { should belong_to(:invoice) }
  it { should belong_to(:item) }

  it "should return the formatted price" do
    merchant = Merchant.create(id: 1, name: "July's awesome goods")
    item = Item.create(id: 1, name: "Cool item", description: "so cool", unit_price: "1000", merchant_id: 1)
    customer = Customer.create(id: 1, first_name: "July", last_name: "Cool")
    invoice = Invoice.create(id: 1, customer_id: 1, merchant_id: 1, status: "pending")
    invoice_item = InvoiceItem.create(id: 1, item_id: 1, invoice_id: 1, quantity: 1, unit_price: "1234")

    expect(invoice_item.unit_price).to eq("12.34")
  end

end
