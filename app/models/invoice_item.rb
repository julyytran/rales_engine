class InvoiceItem < ActiveRecord::Base
  validates :id, presence: true, uniqueness: true
  validates :item_id, presence: true
  validates :invoice_id, presence: true
  validates :quantity, presence: true
  validates :unit_price, presence: true

end
