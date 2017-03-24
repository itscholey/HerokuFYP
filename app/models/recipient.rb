class Recipient < ActiveRecord::Base
  belongs_to :conversation
  belongs_to :user

  has_many :inboxes
  has_many :messages, through: :inboxes
end
