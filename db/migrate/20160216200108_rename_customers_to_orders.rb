class RenameCustomersToOrders < ActiveRecord::Migration
  def change
    rename_table :customers, :orders
  end
end
