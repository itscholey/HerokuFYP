class Actionitemassignee < ActiveRecord::Base
  belongs_to :actionitem
  belongs_to :user
end
