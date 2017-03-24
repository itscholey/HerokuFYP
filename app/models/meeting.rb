class Meeting < ActiveRecord::Base
  extend SimpleCalendar

  has_many :attendees
  has_many :users, through: :attendees

  def start_time
    date
  end

  def user_symbols
    users.map do |user|
      user.name.underscore.to_sym
    end
  end
end
