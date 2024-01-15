class AddCloseToCoffees < ActiveRecord::Migration[6.1]
  def change
    add_column :coffees, :close, :time
  end
end
