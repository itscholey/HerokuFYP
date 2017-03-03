class Message < ActiveRecord::Base
  belongs_to :conversation

  has_many :inboxes
  has_many :recipients, through: :inboxes
end
