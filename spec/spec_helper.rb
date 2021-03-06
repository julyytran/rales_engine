module Helpers
  def json_body
    JSON.parse(response.body)
  end

  def create_test_data
    create_merchants
    create_customers
    create_items
    create_invoices
    create_invoice_items
    create_transactions
  end

  def create_merchants
    Merchant.create(id: 1, name: "July's awesome goods")
    Merchant.create(id: 2, name: "July's dope goods")
    Merchant.create(id: 3, name: "July's cool goods")
  end

  def create_items
    Item.create(id: 1, name: "Cool item", description: "so cool", unit_price: "1000", merchant_id: 1)
    Item.create(id: 2, name: "Dope item", description: "so dope", unit_price: "1000", merchant_id: 2)
    Item.create(id: 3, name: "Awesome item", description: "so awesome", unit_price: "1000", merchant_id: 3)
  end

  def create_customers
    Customer.create(id: 1, first_name: "July", last_name: "Cool")
    Customer.create(id: 2, first_name: "July", last_name: "Dope")
    Customer.create(id: 3, first_name: "July", last_name: "Awesome")
  end

  def create_invoices
    Invoice.create(id: 1, customer_id: 1, merchant_id: 1, status: "pending", updated_at: "2012-03-16 11:55:05")
    Invoice.create(id: 2, customer_id: 2, merchant_id: 2, status: "pending", updated_at: "2012-03-16 11:55:05")
    Invoice.create(id: 3, customer_id: 3, merchant_id: 3, status: "shipped", updated_at: "2012-03-16 11:55:05")
  end

  def create_invoice_items
    InvoiceItem.create(id: 1, item_id: 1, invoice_id: 1, quantity: 1, unit_price: "1234")
    InvoiceItem.create(id: 2, item_id: 2, invoice_id: 2, quantity: 2, unit_price: "5678")
    InvoiceItem.create(id: 3, item_id: 3, invoice_id: 3, quantity: 3, unit_price: "91011")
  end

  def create_transactions
    Transaction.create(id: 1, invoice_id: 1, credit_card_number: "4654405418249632", result: "success")
    Transaction.create(id: 2, invoice_id: 2, credit_card_number: "4654405418249631", result: "success")
    Transaction.create(id: 3, invoice_id: 3, credit_card_number: "4654405418249630", result: "failed")
  end
end

RSpec.configure do |config|
  # rspec-expectations config goes here. You can use an alternate
  # assertion/expectation library such as wrong or the stdlib/minitest
  # assertions if you prefer.
  config.expect_with :rspec do |expectations|
    # This option will default to `true` in RSpec 4. It makes the `description`
    # and `failure_message` of custom matchers include text for helper methods
    # defined using `chain`, e.g.:
    #     be_bigger_than(2).and_smaller_than(4).description
    #     # => "be bigger than 2 and smaller than 4"
    # ...rather than:
    #     # => "be bigger than 2"
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end

  # rspec-mocks config goes here. You can use an alternate test double
  # library (such as bogus or mocha) by changing the `mock_with` option here.
  config.mock_with :rspec do |mocks|
    # Prevents you from mocking or stubbing a method that does not exist on
    # a real object. This is generally recommended, and will default to
    # `true` in RSpec 4.
    mocks.verify_partial_doubles = true
  end

# The settings below are suggested to provide a good initial experience
# with RSpec, but feel free to customize to your heart's content.
=begin
  # These two settings work together to allow you to limit a spec run
  # to individual examples or groups you care about by tagging them with
  # `:focus` metadata. When nothing is tagged with `:focus`, all examples
  # get run.
  config.filter_run :focus
  config.run_all_when_everything_filtered = true

  # Allows RSpec to persist some state between runs in order to support
  # the `--only-failures` and `--next-failure` CLI options. We recommend
  # you configure your source control system to ignore this file.
  config.example_status_persistence_file_path = "spec/examples.txt"

  # Limits the available syntax to the non-monkey patched syntax that is
  # recommended. For more details, see:
  #   - http://rspec.info/blog/2012/06/rspecs-new-expectation-syntax/
  #   - http://www.teaisaweso.me/blog/2013/05/27/rspecs-new-message-expectation-syntax/
  #   - http://rspec.info/blog/2014/05/notable-changes-in-rspec-3/#zero-monkey-patching-mode
  config.disable_monkey_patching!

  # Many RSpec users commonly either run the entire suite or an individual
  # file, and it's useful to allow more verbose output when running an
  # individual spec file.
  if config.files_to_run.one?
    # Use the documentation formatter for detailed output,
    # unless a formatter has already been configured
    # (e.g. via a command-line flag).
    config.default_formatter = 'doc'
  end

  # Print the 10 slowest examples and example groups at the
  # end of the spec run, to help surface which specs are running
  # particularly slow.
  config.profile_examples = 10

  # Run specs in random order to surface order dependencies. If you find an
  # order dependency and want to debug it, you can fix the order by providing
  # the seed, which is printed after each run.
  #     --seed 1234
  config.order = :random

  # Seed global randomization in this process using the `--seed` CLI option.
  # Setting this allows you to use `--seed` to deterministically reproduce
  # test failures related to randomization by passing the same `--seed` value
  # as the one that triggered the failure.
  Kernel.srand config.seed
=end
end
