class Item < ActiveRecord::Base
  validates :id, presence: true, uniqueness: true
  validates :name, presence: true
  validates :description, presence: true
  validates :unit_price, presence: true
  validates :merchant_id, presence: true

   belongs_to :merchant
   has_many :invoice_items
   has_many :invoices, through: :invoice_items

  before_create :format_price

  def format_price
    self.unit_price = sprintf("%.2f", self.unit_price.to_i / 100.0)
  end
end
