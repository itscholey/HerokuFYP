class Inbox < ActiveRecord::Base
  belongs_to :recipient
  belongs_to :message
end
