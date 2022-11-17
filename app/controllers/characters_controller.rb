class CharactersController < ApplicationController
  before_action :set_character, only: %i[show edit update destroy]

  def index
    @characters = Character.all
    @markers = @characters.geocoded.map do |character|
      {
        lat: character.latitude,
        lng: character.longitude,
        info_window: render_to_string(partial: 'info_window', locals: { character: character }),
        image_url: helpers.asset_url("marker.png")
      }
      
    if params[:query].nil?
      @characters = Character.all
    else
      @characters = Character.search_by_name_and_description(params[:query])
    end
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

  def edit
  end

  def update
    # @character.photos.attach(params[:photos])
    if @character.update(character_params)
      redirect_to character_path(@character), notice: "Character was successfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @character.destroy
    redirect_to my_characters_path, status: :see_other
  end

  def my_characters
    @characters = Character.where(user: current_user)
  end

  private

  def set_character
    @character = Character.find(params[:id])
  end

  def character_params
    params.require(:character).permit(:name, :description, :price, :category, :user_id, :address, photos: [])
  end
end
