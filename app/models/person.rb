class Person < ActiveRecord::Base
  validates_presence_of :name, :cuilt

  def to_s
    "#{cuilt} #{name}"
  end
end
