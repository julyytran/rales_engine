class Transaction < ActiveRecord::Base
  validates :id, presence: true, uniqueness: true
  validates :invoice_id, presence: true
  validates :credit_card_number, presence: true
  validates :result, presence: true
end
