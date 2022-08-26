class BookingsController < ApplicationController
  before_action :set_experience, only: [:new, :create]
  before_action :set_booking, only: [:show, :destroy]

  def index
    @bookings = Booking.all
    @bookings = policy_scope(Booking)
  end

  def show
    authorize @booking
  end

  def new
    @booking = Booking.new
    authorize @booking
  end

  def create
    @booking = Booking.new(booking_params)
    @booking.experience = @experience
    @booking.user = current_user
    authorize @booking
     if @booking.save
      redirect_to booking_path(@booking), notice: "The experience was successfully booked"
    else
      render :new, status: :unprocessable_entity
     end
  end

  def destroy
    authorize @booking
    @booking.destroy
    redirect_to bookings_path, status: :see_other, notice: "The experience was successfully cancelled"
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
