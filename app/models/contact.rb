class Contact < ActiveRecord::Base
  belongs_to :client

  enum kind: %i(address email phone_number skype)

  validates_presence_of :client, :kind, :value
  # validates_existence_of :client

  # address validation
  validates :value,
    length: { in: 3..255 },
    if: "kind == 0"
  # email validation
  validates :value,
    length: { in: 2..50 },
    format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i },
    if: "kind == 1"
  # phone number validation
  validates :value,
    format: { with: /\(?([0-9]{3})\)?([ .-]?)([0-9]{3})\2([0-9]{4})/ },
    if: "kind == 3"
  # skype validation
  validates :value,
    length: { in: 1..50 },
    if: "kind == 4"
end
