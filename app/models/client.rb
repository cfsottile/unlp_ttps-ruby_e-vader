class Client < ActiveRecord::Base
  has_many :contacts, dependent: :destroy
  has_many :invoices, dependent: :destroy

  enum gender: %i(female male)

  validates_presence_of :first_name, :last_name, :document_number, :gender, :birthday, :cuilt

  def to_s
    "#{document_number} - #{last_name}, #{first_name}"
  end
end
