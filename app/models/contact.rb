class Contact < ActiveRecord::Base
  belongs_to :client

  enum kind: %i(address email phone_number skype)

  validates_presence_of :client, :kind, :value
  # validates_existence_of :client
end
