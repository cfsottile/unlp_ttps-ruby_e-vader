require 'test_helper'

class InvoiceTest < ActiveSupport::TestCase
  def setup
    @client = clients(:four)
    @client.save

    @person = people(:one)
    @person.save
  end

  test "new invoice with no invalid data" do
    invoice = Invoice.new(
      client_id: @client.id,
      person_id: @person.id,
      description: "At vero eos et accusamus",
      amount: 1000.3,
      emission_date: Date.new(2015, 12, 16)
    )
    invoice.save
    refute_nil(Invoice.find(invoice.id), "invoice should be created")
  end

  test "new invoice with invalid amount" do
    invoice = Invoice.new(
      client_id: @client.id,
      person_id: @person.id,
      description: "At vero eos et accusamus",
      amount: "aa",
      emission_date: Date.new(2015, 12, 16)
    )
    refute(invoice.save, "invoice should not be created")
  end
end
