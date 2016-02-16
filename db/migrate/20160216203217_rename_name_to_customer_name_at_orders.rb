class RenameNameToCustomerNameAtOrders < ActiveRecord::Migration
  def change
    rename_column :orders, :name, :customer_name
  end
end
