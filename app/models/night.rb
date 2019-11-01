class Night < ApplicationRecord
  belongs_to :user

  validates_presence_of :quality, :sleep_hour, :wake_hour

  # wake must be higher than sleep
end
