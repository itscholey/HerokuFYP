class Actionplan < ActiveRecord::Base
  belongs_to :student, class_name: 'User', foreign_key: 'student_id'
  belongs_to :supervisor, class_name: 'User', foreign_key: 'supervisor_id'

  has_many :actionitems

end
