class AddShopToCoffees < ActiveRecord::Migration[6.1]
  def change
    add_column :coffees, :shop, :string
  end
end
