class AddDetailsToCoffees < ActiveRecord::Migration[6.1]
  def change
    add_column :coffees, :lat, :float
    add_column :coffees, :lng, :float
  end
end
