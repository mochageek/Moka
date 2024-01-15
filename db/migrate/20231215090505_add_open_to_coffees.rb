class AddOpenToCoffees < ActiveRecord::Migration[6.1]
  def change
    add_column :coffees, :open, :time
  end
end
