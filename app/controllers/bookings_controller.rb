class BookingsController < ApplicationController
  before_action :set_experience, only: [:new, :create]
  before_action :set_booking, only: [:show, :destroy]

  def index
  end

  def show

  end

  def new
  end

  def create

  end

  def destroy

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
