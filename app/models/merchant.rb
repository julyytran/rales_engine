class Merchant < ActiveRecord::Base
  validates :id, presence: true, uniqueness: true
  validates :name, presence: true
end
