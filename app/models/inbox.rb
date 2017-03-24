class Inbox < ActiveRecord::Base
  belongs_to :recipient, dependent: :destroy
  belongs_to :message, dependent: :destroy
end
