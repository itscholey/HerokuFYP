class Actionitem < ActiveRecord::Base
  belongs_to :actionplan
  has_many :actionitemassignees
  has_many :users, through: :actionitemassignees

  def start_time
    target_completion_date
  end
end
