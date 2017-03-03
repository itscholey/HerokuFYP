class User < ActiveRecord::Base
  before_save { email.downcase! }
  before_save { username.downcase! }
  validates :username,  presence: true, length: { maximum: 10 },
                        uniqueness: true, case_sensitive: false
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
  validates :email,     presence: true, length: { maximum: 254 },
                        format: { with: VALID_EMAIL_REGEX }, case_sensitive: false
  validates :name,      presence: true, length: { maximum: 50 }
  #validates :password,  presence: true, length: { minimum: 8 }


  has_many :assignments
  has_many :roles, through: :assignments

  belongs_to :subject #as teacher

  has_many :enrolments #as a student
  has_many :subjects, through: :enrolments

  has_many :attendees
  has_many :meetings, through: :attendees

  has_many :recipients
  has_many :conversations, through: :recipients

  has_secure_password

  def role_symbols
    roles.map do |role|
      role.name.underscore.to_sym
    end
  end

  def role?(role)
  roles.any? { |r| r.name.underscore.to_sym == role }
end

  def enrolled?(subject)
    enrollments.any? { |e| e.name.underscore.to_sym == subject }
  end

  def enrolments(user)
    return User.find_by_sql("
          SELECT * FROM enrolments, users WHERE enrolments.student_id = users.id AND users.id = #{user.id} ")
  end
end
