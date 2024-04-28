class Booking < ApplicationRecord
  belongs_to :flight
  belongs_to :owner, class_name: 'User', foreign_key: 'user_id'
  has_many :passangers, dependent: :destroy
end
