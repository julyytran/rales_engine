class ItemSerializer < ActiveModel::Serializer
  attributes :id, :name, :description, :merchant_id
  attribute :formatted_unit_price, key: :unit_price

  def formatted_unit_price
    sprintf("%.2f", object.unit_price.to_i / 100.0)
  end
end
