class Order < ActiveRecord::Base
  enum status: [:ready, :shipped, :delivered]
  enum notification_status: [:queued, :failed, :sent]
end
