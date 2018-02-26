class AddAddressToDogs < ActiveRecord::Migration[5.1]
  def change
        add_column :dogs, :address, :string

  end
end
