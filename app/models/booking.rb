class Booking < ApplicationRecord
  belongs_to :flight
  belongs_to :owner, class_name: 'User', foreign_key: 'id'
  has_many :passangers, dependent: :destroy
  accepts_nested_attributes_for :passangers, reject_if: :all_blank, allow_destroy: true
  validates :flight_id, presence: true
  validates :owner_id, presence: true
  validates :passangers, presence: true

  def departing_time
    flight.departure_date.strftime('%d-%m-%Y %H:%M')
  end
  def arrival_time
    flight.arrival_date.strftime('%d-%m-%Y %H:%M')
  end
  def arrival_airport
    flight.arrival_airport.code
  end 
  def departure_airport
    flight.departure_airport.code
  end
end
