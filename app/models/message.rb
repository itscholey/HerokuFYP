class Message < ActiveRecord::Base
  belongs_to :conversation, dependent: :destroy

  has_many :inboxes, dependent: :destroy
  has_many :recipients, through: :inboxes
end
