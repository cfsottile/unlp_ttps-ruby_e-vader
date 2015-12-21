class Client < ActiveRecord::Base
  has_many :contacts, dependent: :destroy
  has_many :invoices, dependent: :destroy
  has_many :people, through: :invoices

  enum gender: %i(female male)

  validates_presence_of :first_name, :last_name, :document_number, :gender, :birthday, :cuilt
  validates :first_name, :last_name,
    length: { in: 2..50 },
    format: { with: /\A[A-zñÁÉÍÓÚáéíóúü][A-zñáéíóúÁÉÍÓÚü'\ ]+\z/ }
  validates :document_number,
    length: { in: 1..8 },
    format: { with: /\A[0-9]+\z/ },
    uniqueness: true
  validates :cuilt,
    length: { is: 13 },
    format: { with: /\A[0-9]{2}-[0-9]{8}-[0-9]\z/ },
    uniqueness: true
  validates :birthday,
    date: { before: Proc.new { Time.now + 1.day } }
  validates_associated :contacts
  validates_associated :invoices

  def to_s
    "#{document_number} - #{last_name}, #{first_name}"
  end

  def age
    age = Date.current.year - birthday.year
    if Date.current.month >= birthday.month || Date.current.day >= birthday.day
      age += 1
    end
    age
  end

  def total_invoiced_amount
    invoices.inject(0) { |sum, i| sum + i.amount }
  end

  def invoices_from(date)
    invoices.where("emission_date >= ?", date).count
  end

  def more_invoiced_people(amount)
    people
      .select("name, cuilt, sum(amount) as sum_amount")
      .group(:id)
      .reorder("sum_amount DESC")
      .limit(amount)
  end
end
