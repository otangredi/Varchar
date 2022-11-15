class CharactersController < ApplicationController
  before_action :set_character, only: %i[show]

  def index
    @characters = Character.all
  end

  def show
    @booking = Booking.new
  end

  def new
    @character = Character.new
  end

  def create
    @character = Character.new(character_params)
    @character.user = current_user

    if @character.save
      redirect_to @character, notice: 'Character was successfully created!'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy

  end

  def my_characters
    @characters = Character.where(user: current_user)
  end

  private

  def set_character
    @character = Character.find(params[:id])
  end

  def character_params
    params.require(:character).permit(:name, :description, :price, :category, :user_id)
  end
end
