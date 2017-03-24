class Attendee < ActiveRecord::Base
  belongs_to :user, dependent: :destroy
  belongs_to :meeting, dependent: :destroy
end
