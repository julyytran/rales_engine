class CreateCustomers < ActiveRecord::Migration
  def change
    enable_extension 'citext'

    create_table :customers do |t|
      t.citext :first_name
      t.citext :last_name
      t.citext :created_at
      t.citext :updated_at

      t.timestamps null: false
    end
  end
end
