class Patient < ActiveRecord::Base
  has_many :appointments

  validates :name,  presence: true
  validates :money_amount, presence: true, numericality: true

  def to_s
    name
  end
end
