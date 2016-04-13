class CreateItems < ActiveRecord::Migration
  def change
    enable_extension 'citext'

    create_table :items do |t|
      t.citext :name
      t.citext :description
      t.citext :unit_price
      t.integer :merchant_id
      t.citext :created_at
      t.citext :updated_at

      t.timestamps null: false
    end
  end
end
