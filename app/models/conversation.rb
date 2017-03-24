class Conversation < ActiveRecord::Base
  has_many :recipients, dependent: :destroy
  has_many :users, through: :recipients
end
