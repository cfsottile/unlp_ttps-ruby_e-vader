require 'test_helper'

class ClientTest < ActiveSupport::TestCase
  test "new client without contact data" do
    client = new_client_with_document_number("90100210")
    assert(client.save, "client should be saved")
  end

  test "new client with contact data" do
    client = new_client_with_document_number("90100210")
    contact = client.contacts.new(
      kind: "email",
      value: "ada_lovelace@arnet.com.ar"
    )

    assert(client.save, "client should be saved")

    client.reload
    saved_contact = client.contacts.first
    refute_nil(saved_contact, "contact should be saved")
    assert_equal(saved_contact.kind, contact.kind, "contact was not correctly saved")
    assert_equal(saved_contact.value, contact.value, "contact was not correctly saved")
  end

  test "new client with an invalid document number" do
    client = new_client_with_document_number("document")
    refute(client.save, "client should not be saved")
  end

  test "delete client who has invoices" do
    client = clients(:four)
    client_invoices = client.invoices.to_a
    client.destroy

    assert(client.destroyed?, "client should be deleted")

    client_invoices.each do |i|
      assert(i.destroyed?, "invoices should be deleted")
    end
  end

  test "delete client who has no invoices" do
    client = clients(:six)
    client.destroy

    assert(client.destroyed?, "client should be deleted")
  end

  private
    def new_client_with_document_number(document_number)
      Client.new(
        first_name: "Ada",
        last_name: "Lovelace",
        document_number: document_number,
        gender: "female",
        birthday: Date.new(1815, 12, 10),
        cuilt: "20-90100210-5"
      )
    end
end
