class Contact < ActiveRecord::Base
  belongs_to :client

  validates_presence_of :client, :type, :value
  validates_existence_of :client
end
