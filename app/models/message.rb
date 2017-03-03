class Message < ActiveRecord::Base
  belongs_to :conversation
  belongs_to :recipient
end
