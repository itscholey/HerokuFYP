class Conversation < ActiveRecord::Base
  has_many :recipients
  has_many :users, through: :recipients

  validates :user_ids, presence: true, length: { minimum: 2 }
end
