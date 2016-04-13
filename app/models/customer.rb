class Customer < ActiveRecord::Base
  validates :id, presence: true, uniqueness: true
  validates :first_name, presence: true
  validates :last_name, presence: true

  has_many :invoices
  has_many :transactions, through: :invoices
end
