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
    format: { with: /\A[0-9]+\z/ }
  validates :cuilt,
    length: { is: 13 },
    format: { with: /\A[0-9]{2}-[0-9]{8}-[0-9]\z/ }
  validates :birthday,
    date: { before: Proc.new { Time.now + 1.day } }

  def to_s
    "#{document_number} - #{last_name}, #{first_name}"
  end


end
