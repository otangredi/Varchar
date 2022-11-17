class AddCoordinatesToCharacters < ActiveRecord::Migration[7.0]
  def change
    add_column :characters, :latitude, :float
    add_column :characters, :longitude, :float
  end
end
