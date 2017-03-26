class Actionitem < ActiveRecord::Base
  belongs_to :actionplan
  has_many :actionitemassignees
  has_many :users, through: :actionitemassignees
end
