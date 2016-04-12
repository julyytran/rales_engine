class InvoiceItem < ActiveRecord::Base
  validates :id, presence: true, uniqueness: true
  validates :item_id, presence: true
  validates :invoice_id, presence: true
  validates :quantity, presence: true
  validates :unit_price, presence: true

  before_save :format_price

  def format_price
    self.unit_price = sprintf('%.2f', (unit_price.to_i/100.0))
  end
end
