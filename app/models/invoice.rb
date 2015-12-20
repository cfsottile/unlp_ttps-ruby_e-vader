class Invoice < ActiveRecord::Base
  belongs_to :client
  belongs_to :person

  default_scope { order(emission_date: :desc) }

  validates_presence_of :client, :person, :description, :amount, :emission_date
  # validates_existence_of :client, :person
  validates :description,
    length: { in: 2..255 }
  validates :amount,
    numericality: {
      greater_than_or_equal_to: 0,
      less_than_or_equal_to: 9999999999.99
    }
  validates :emission_date,
    date: { before: Proc.new { Time.now + 1.day } }
end
