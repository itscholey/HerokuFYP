class Message < ActiveRecord::Base
  validates :recipient_id, presence: true
  validates :body, presence: true, length: { maximum: 1000 }

  belongs_to :conversation

  has_many :inboxes
  has_many :recipients, through: :inboxes
end
