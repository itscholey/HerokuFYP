class Lesson < ActiveRecord::Base
  belongs_to :subject, dependent: :destroy
end
