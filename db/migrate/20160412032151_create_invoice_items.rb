class CreateInvoiceItems < ActiveRecord::Migration
  def change
    enable_extension 'citext'

    create_table :invoice_items do |t|
      t.integer :item_id
      t.integer :invoice_id
      t.integer :quantity
      t.citext :unit_price
      t.citext :created_at
      t.citext :updated_at

      t.timestamps null: false
    end
  end
end
