require 'csv'

namespace :import do

  desc 'Imports data from csv'
  task data: :environment do

    data = [
      {model: Customer, file_path: './vendor/assets/data/customers.csv'},
      {model: Merchant, file_path: './vendor/assets/data/merchants.csv'},
      {model: Item, file_path: './vendor/assets/data/items.csv'},
      {model: Invoice, file_path: './vendor/assets/data/invoices.csv'},
      {model: InvoiceItem, file_path: './vendor/assets/data/invoice_items.csv'}
    ]

    data.each do |datum|
      CSV.foreach(datum[:file_path], headers: true, header_converters: :symbol) do |row|
        model = datum[:model].create(row.to_h)
        if model.save
          puts "Created #{datum[:model]}!"
        else
          puts "Invalid record"
        end
      end
    end

    transactions = './vendor/assets/data/transactions.csv'
    CSV.foreach(transactions, headers: true, header_converters: :symbol) do |row|
      trans = Transaction.create(row.to_h.except(:credit_card_expiration_date))
      if trans.save
        puts "Created Transaction!"
      else
        puts "Invalid record"
      end
    end
  end
end
