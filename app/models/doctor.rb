class Doctor < ActiveRecord::Base
  has_many :appointments

  validates :name, presence: true
  validates :hourly_rate, presence: true, numericality: true
  validates :hours_per_week, presence: true, numericality: { only_integer: true }

  def hours_available?
    hours_per_week > appointments.count
  end

  def to_s
    name
  end
end
