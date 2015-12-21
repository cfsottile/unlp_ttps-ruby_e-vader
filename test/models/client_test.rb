require 'test_helper'

class ClientTest < ActiveSupport::TestCase
  # def setup
  #   @good_client = client(:one)
  #   @bad_client = client(:two)
  # end

  test "new client without contact data" do
    client = clients(:four)
    assert(client.save, "client should be saved")
  end

  test "new client with contact data" do
    client = clients(:four)
    contact = contacts(:four)
    client.contacts<<contact

    assert(client.save, "client should be saved")

    saved_contact = client.contacts.first
    refute_nil(saved_contact, "contact should be saved")
    assert_equal(saved_contact.kind, contact.kind, "contact was not correctly saved")
    assert_equal(saved_contact.value, contact.value, "contact was not correctly saved")
  end

  test "new client with an invalid document number" do
    client = clients(:five)
    refute(client.save, "client should not be saved")
  end

  test "delete client who has invoices" do
    client = clients(:four)
    client.save
    invoices.each { |i| i.save }

    client_invoices = client.invoices
    client.destroy

    assert_nil(Client.find_by(document_number: "90100203"), "client should be deleted")

    client_invoices.each do |i|
      assert_nil(Invoice.find(i.id), "invoices should be deleted")
    end
  end

  test "delete client who has no invoices" do
    client = clients(:six)
    client.save
    client.destroy

    assert_nil(Client.find_by(document_number: "90100205"), "client should be deleted")
  end
end
