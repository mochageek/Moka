class CreateCoffeeImages < ActiveRecord::Migration[6.1]
  def change
    create_table :coffee_images do |t|
      t.integer :coffee_id
      t.string :image_id

      t.timestamps
    end
  end
end
