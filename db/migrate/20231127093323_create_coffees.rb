class CreateCoffees < ActiveRecord::Migration[6.1]
  def change
    create_table :coffees do |t|
      t.string :area
      t.string :image
      t.string :string

      t.timestamps
    end
  end
end
