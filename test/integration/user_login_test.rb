require 'test_helper'

class UserLoginTest < ActionDispatch::IntegrationTest
    test "login with invalid info" do
      get login_path
      assert_response :success
      assert_template 'sessions/new'
      # send information to create action
      post login_path, session: {username: "", password: ""}
      # assert this gets redirected back to the new action as it is invalid
      assert_template 'sessions/new'
      # assert there is a flash message for an error
      assert_not flash.empty?
      # submit a different request
      get root_path
      # assert the flash message does not persist
      assert flash.empty?
    end
end
