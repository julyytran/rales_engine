class Merchant < ActiveRecord::Base
  validates :id, presence: true, uniqueness: true
  validates :name, presence: true

  has_many :items
  has_many :invoices

  def revenue
    successful_invoices = self.invoices.successful

    invoice_items = successful_invoices.map { |invoice| invoice.invoice_items }.flatten

    subtotals = invoice_items.map { |item| item.quantity * item.unit_price.to_f  }
    revenue = subtotals.reduce(:+)

    {"revenue" => sprintf("%.2f", revenue)}
  end
end
