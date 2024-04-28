class Flight < ApplicationRecord
  belongs_to :departure_airport, class_name: 'Airport'
  belongs_to :arrival_airport, class_name: 'Airport'

  scope :departing_from, ->(airport) { where(departure_airport_id: airport) }
  scope :arriving_at, ->(airport) { where(arrival_airport_id: airport) }
  scope :upcoming, -> { where('departure_date > ?', Time.now) }
  scope :dates , -> { distinct.where('departure_date > ?', Time.now).order('departure_date') }
  scope :departing_on, ->(date) { where(departure_date: date.beginning_of_day..date.end_of_day) }
  def duration
    ((arrival_date - departure_date) / 1.hour).round
  end

  def departure_time
    departure_date.strftime('%H:%M')
  end

  def arrival_time
    arrival_date.strftime('%H:%M')
  end

  def self.search(from_id, to_id, date)
    flights = Flight.upcoming
    flights = flights.departing_from(from_id)
    flights = flights.arriving_at(to_id)
    flights = flights.departing_on(date)
    flights
  end
end
