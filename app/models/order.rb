class Order < ActiveRecord::Base
  enum status: [:ready, :shipped, :dropped_off]
  enum notification_status: [:no_status, :queued, :failed, :sent, :delivered]
end
