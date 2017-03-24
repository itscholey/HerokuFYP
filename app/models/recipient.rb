class Recipient < ActiveRecord::Base
  belongs_to :conversation, dependent: :destroy
  belongs_to :user, dependent: :destroy

  has_many :inboxes, dependent: :destroy
  has_many :messages, through: :inboxes
end
