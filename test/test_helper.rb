ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'
include SessionsHelper


class ActiveSupport::TestCase
  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  fixtures :all

    def admin_log_in
      @user = users(:admin)
      rids = [roles(:admin).id]
      @user.role_ids = rids
      assignment = Assignment.new
      assignment.user_id = @user.id
      assignment.role_id = roles(:admin).id
      assignment.save
      @user.save!
      log_in @user
    end
end
