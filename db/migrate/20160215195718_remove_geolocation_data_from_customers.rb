class RemoveGeolocationDataFromCustomers < ActiveRecord::Migration
  def change
    remove_column :customers, :latitude
    remove_column :customers, :longitude
  end
end
