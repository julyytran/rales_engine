class Merchant < ActiveRecord::Base
  validates :id, presence: true, uniqueness: true
  validates :name, presence: true

  has_many :items
  has_many :invoices

  def revenue
    
  end
end
