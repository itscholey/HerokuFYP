require 'test_helper'

class StaticPagesControllerTest < ActionController::TestCase
  test "should get calendar" do
    get :calendar
    assert_response :success
  end

end
