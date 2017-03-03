class Meeting < ActiveRecord::Base
  has_many :attendees
  has_many :users, through: :attendees

  def user_symbols
    users.map do |user|
      user.name.underscore.to_sym
    end
  end
end
