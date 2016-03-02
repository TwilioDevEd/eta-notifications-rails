class AddStatusAndNotificationStatusToOrders < ActiveRecord::Migration
  def change
    add_column :orders, :status, :integer, default: 0
    add_column :orders, :notification_status, :integer, default: 0
  end
end
