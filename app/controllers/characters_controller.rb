class CharactersController < ApplicationController
  before_action :set_character, only: %i[show]

  def index
    @characters = Character.all
  end

  def show
    @booking = Booking.new
  end

  private

  def set_character
    @character = Character.find(params[:id])
  end
end
