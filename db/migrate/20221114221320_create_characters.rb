class CreateCharacters < ActiveRecord::Migration[7.0]
  def change
    create_table :characters do |t|
      t.string :name
      t.string :description
      t.integer :price
      t.string :category

      t.timestamps
    end
  end
end
