require 'csv'

namespace :import do

  desc "import customers from csv"
  task customers: :environment do
    counter = 0
    filename = File.join Rails.root, "db/data/customers.csv"
    CSV.foreach(filename, headers: true) do |row|
      customer = Customer.create(id: row["id"],
                           first_name: row["first_name"],
                           last_name: row["last_name"],
                           created_at: row["created_at"],
                           updated_at: row["updated_at"])
      puts {customer.errors.full_messages.join(", ")} if customer.errors.any?
      counter += 1 if customer.persisted?
    end
  end

  desc "import merchants from csv"
  task merchants: :environment do
    counter = 0
    filename = File.join Rails.root, "db/data/merchants.csv"
    CSV.foreach(filename, headers: true) do |row|
      merchant = Merchant.create(id: row["id"],
                           name: row["name"],
                           created_at: row["created_at"],
                           updated_at: row["updated_at"])
      puts {merchant.errors.full_messages.join(", ")} if merchant.errors.any?
      counter += 1 if merchant.persisted?
    end
  end

  desc "import items from csv"
  task items: :environment do
    counter = 0
    filename = File.join Rails.root, "db/data/items.csv"
    CSV.foreach(filename, headers: true) do |row|
      item = Item.create(id: row["id"],
                         name: row["name"],
                         description: row["description"],
                         unit_price: row["unit_price"],
                         merchant_id: row["merchant_id"],
                         created_at: row["created_at"],
                         updated_at: row["updated_at"])
      puts {item.errors.full_messages.join(", ")} if item.errors.any?
      counter += 1 if item.persisted?
    end
  end

  desc "import invoices from csv"
  task invoices: :environment do
    counter = 0
    filename = File.join Rails.root, "db/data/invoices.csv"
    CSV.foreach(filename, headers: true) do |row|
      invoice = Invoice.create(id: row["id"],
                         customer_id: row["customer_id"],
                         merchant_id: row["merchant_id"],
                         status: row["status"],
                         created_at: row["created_at"],
                         updated_at: row["updated_at"])
      puts {invoice.errors.full_messages.join(", ")} if invoice.errors.any?
      counter += 1 if invoice.persisted?
    end
  end

  desc "import invoice_items from csv"
  task invoice_items: :environment do
    counter = 0
    filename = File.join Rails.root, "db/data/invoice_items.csv"
    CSV.foreach(filename, headers: true) do |row|
      invoice_item = InvoiceItem.create(id: row["id"],
                               item_id: row["item_id"],
                               invoice_id: row["invoice_id"],
                               quantity: row["quantity"],
                               unit_price: row["unit_price"],
                               created_at: row["created_at"],
                               updated_at: row["updated_at"])
      puts {invoice_item.errors.full_messages.join(", ")} if invoice_item.errors.any?
      counter += 1 if invoice_item.persisted?
    end
  end

  desc "import transactions from csv"
  task transactions: :environment do
    counter = 0
    filename = File.join Rails.root, "db/data/transactions.csv"
    CSV.foreach(filename, headers: true) do |row|
      transaction = Transaction.create(id: row["id"],
                         invoice_id: row["invoice_id"],
                         credit_card_number: row["credit_card_number"],
                         credit_card_expiration_date: row["credit_card_expiration_date"],
                         result: row["result"],
                         created_at: row["created_at"],
                         updated_at: row["updated_at"])
      puts {transaction.errors.full_messages.join(", ")} if transaction.errors.any?
      counter += 1 if transaction.persisted?
    end
  end
end
