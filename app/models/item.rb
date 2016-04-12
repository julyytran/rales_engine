class Item < ActiveRecord::Base
  validates :id, presence: true, uniqueness: true
  validates :name, presence: true
  validates :description, presence: true
  validates :unit_price, presence: true
  validates :merchant_id, presence: true

  before_save :format_price

  def format_price
    self.unit_price = ((unit_price.to_i)/100.0)
  end
end
