class Subject < ActiveRecord::Base
  validates :name,  presence: true, length: { maximum: 50 },
                    case_sensitive: false
  validates :user_id, presence: true
  validates :classGroup, presence: true
  belongs_to :user, dependent: :destroy #teacher
  has_many :lessons, dependent: :destroy

  has_many :enrolments, dependent: :destroy #students
  has_many :users, through: :enrolments
end
