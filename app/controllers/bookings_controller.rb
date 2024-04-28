class BookingsController < ApplicationController
  before_action :authenticate_user!

  def new
    @flight = Flight.find(params[:flight_id])
    @booking = Booking.new
    @passanger_count = params[:passanger_count].to_i
    @passanger_count.times { @booking.passangers.build }
  end
end
