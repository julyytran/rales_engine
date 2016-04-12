class Invoice < ActiveRecord::Base
  validates :id, presence: true, uniqueness: true
  validates :customer_id, presence: true
  validates :merchant_id, presence: true
  validates :status, presence: true
end
