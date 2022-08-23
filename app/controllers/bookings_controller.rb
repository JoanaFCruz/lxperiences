class BookingsController < ApplicationController
  before_action :set_experience, only: [:new, :create]
  before_action :set_booking, only: [:show, :destroy]

  def index
    @bookings = Booking.all
  end

  def show
  end

  def new
    @booking = Booking.new
  end

  def create
    @booking = Booking.new(booking_params)
    @booking.experience = @experience
    @booking.user = current_user
     if @booking.save
      redirect_to booking_path(@booking)
    else
      render :new, status: :unprocessable_entity
     end
  end

  def destroy
    @booking.delete
    redirect_to bookings_path, status: :see_other
  end

  private

  def set_experience
    @experience = Experience.find(params[:experience_id])
  end

  def set_booking
    @booking = Booking.find(params[:id])
  end

  def booking_params
    params.require(:booking).permit(:start_date, :end_date)
  end
end
