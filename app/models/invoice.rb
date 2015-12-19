class Invoice < ActiveRecord::Base
  belongs_to :client
  belongs_to :person

  validates_presence_of :client, :person, :description, :amount, :emission_date
  # validates_existence_of :client, :person
end
