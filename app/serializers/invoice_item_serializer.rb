class InvoiceItemSerializer < ActiveModel::Serializer
  attributes :id, :item_id, :invoice_id, :quantity
  attribute :formatted_unit_price, key: :unit_price

  def formatted_unit_price
    object.unit_price.to_i / 100.0
  end
end
