class BookingsController < ApplicationController
  before_action :authenticate_user!

  def new
    @booking = Booking.new
    @flight_id = params[:flight_id]
    @passanger_count = params[:passanger_count].to_i
    @passanger_count.times { @booking.passangers.build }
  end

  def create
    @booking = current_user.bookings.build(booking_params)
    @booking.owner = current_user
    if @booking.save
      flash[:notice] = 'Booking created successfully'
      redirect_to @booking
    else
      flash.now[:alert] = 'Please fix the errors'
      render :new, status: :unprocessable_entity
    end
  end
  def show
    @booking = Booking.find(params[:id])
    @passangers = @booking.passangers
  end

  private

  def booking_params
    params.require(:booking).permit(:flight_id, :user_id, :passanger_count, passangers_attributes: %i[name email])
  end
end
