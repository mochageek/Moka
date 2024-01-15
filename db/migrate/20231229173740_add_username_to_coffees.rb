class AddUsernameToCoffees < ActiveRecord::Migration[6.1]
  def change
    add_column :coffees, :username, :string
  end
end
