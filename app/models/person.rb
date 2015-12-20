class Person < ActiveRecord::Base
  validates_presence_of :name, :cuilt
  validates :name,
    length: { in: 2..50 },
    format: { with: /\A[A-zñÁÉÍÓÚáéíóúü][A-zñáéíóúÁÉÍÓÚü'\ ]+\z/ }
  validates :cuilt,
    length: { is: 13 },
    format: { with: /\A[0-9]{2}-[0-9]{8}-[0-9]\z/ }

  def to_s
    "#{cuilt} #{name}"
  end
end
