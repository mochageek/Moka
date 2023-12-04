class AddBodyToCoffees < ActiveRecord::Migration[6.1]
  def change
    add_column :coffees, :body, :text
  end
end
