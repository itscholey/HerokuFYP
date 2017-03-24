class Conversation < ActiveRecord::Base
  has_many :recipients
  has_many :users, through: :recipients
end
