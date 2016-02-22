class Order < ActiveRecord::Base
  enum status: [:ready, :shipped, :commited]
  enum notification_status: [:queued, :failed, :sent, :delivered]
end
