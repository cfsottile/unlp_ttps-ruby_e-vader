class Client < ActiveRecord::Base
  has_many :contacts
  has_many :invoices

  enum gender: %i(female male)

  validates_presence_of :first_name, :last_name, :document_number, :gender, :birthday, :cuilt
end
