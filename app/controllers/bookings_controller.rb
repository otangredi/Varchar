class BookingsController < ApplicationController
  before_action :set_booking, only: %i[show edit destroy]

  def new
    @booking = Booking.new
  end

  def create
    @booking = Booking.new(params_booking)
    @booking.character = Character.find(params[:character_id])
    @booking.user = current_user
    @booking.status = 0

    if @booking.save!
      redirect_to booking_path(@booking)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
  end

  def edit
  end

  def set_status
    @booking = Booking.find(params[:id])
    @booking.status = params[:status].to_i
    @booking.save!
    redirect_to host_bookings_path, status: :see_other
  end

  def destroy
    @booking.destroy
    redirect_to my_bookings_path, status: :see_other
  end

  def my_bookings
    @bookings = Booking.where(user: current_user)
  end

  def host_bookings
    @host_bookings = current_user.host_bookings
  end

  def host_booking
  end

  private

  def set_booking
    @booking = Booking.find(params[:id])
  end

  def params_booking
    params.require(:booking).permit(:start_date, :end_date, :status, :user_id, :character_id)
  end

  def find_host_character
    @host_characters = Character.where(user: current_user)
  end
end
