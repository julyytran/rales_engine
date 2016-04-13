class Invoice < ActiveRecord::Base
  validates :id, presence: true, uniqueness: true
  validates :customer_id, presence: true
  validates :merchant_id, presence: true
  validates :status, presence: true

  belongs_to :merchant
  belongs_to :customer
  has_many :invoice_items
  has_many :items, through: :invoice_items
  has_many :transactions
end
