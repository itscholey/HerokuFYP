class Lesson < ActiveRecord::Base
  belongs_to :subject
  mount_uploader :lesson_work, LessonWorkUploader
end
