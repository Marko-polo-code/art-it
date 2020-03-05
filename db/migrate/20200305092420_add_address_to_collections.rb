class AddAddressToCollections < ActiveRecord::Migration[5.2]
  def change
    add_column :collections, :address, :string
  end
end
