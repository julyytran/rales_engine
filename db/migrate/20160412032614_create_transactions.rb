class CreateTransactions < ActiveRecord::Migration
  def change
    enable_extension 'citext'

    create_table :transactions do |t|
      t.integer :invoice_id
      t.citext :credit_card_number
      t.citext :result
      t.citext :created_at
      t.citext :updated_at

      t.timestamps null: false
    end
  end
end
