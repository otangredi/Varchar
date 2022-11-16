class BookingsController < ApplicationController
  def new
    @booking = Booking.new
  end

  def create
    @booking = Booking.new(params_booking)
    @booking.character = Character.find(params[:character_id])
    @booking.user = current_user

    if @booking.save!
      redirect_to booking_path(@booking)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @booking = Booking.find(params[:id])
  end

  def edit
  end

  def set_status
  end

  def destroy
  end

  def my_bookings
    @bookings = Booking.where(user: current_user)
  end

  # def host_bookings
  #   @host_bookings = []
  #   characters = current_user.characters
  #   characters.each do |character|
  #     result = Booking.where(character_id: character.id)
  #     @host_bookings << result if result != []
  #   end
  #   @host_bookings
  # end

  def host_bookings
    characters = current_user.characters
    @host_bookings = characters.select do |character|
      result = Booking.where(character_id: character.id)
      if result != []
        {
          name: character.name,
          descripton: character.description,
          price: character.price,
          bookings: result
        }
      end
    end
  end

  def host_booking
  end

  private

  def params_booking
    params.require(:booking).permit(:start_date, :end_date, :status, :user_id, :character_id)
  end
end
