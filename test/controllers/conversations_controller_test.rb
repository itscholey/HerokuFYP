require 'test_helper'

class ConversationsControllerTest < ActionController::TestCase
  def setup
    admin_log_in
  end

  test "should get index" do
    get :index
    assert_response :success
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should get show" do
    get :show, id: @user.id
    assert_response :success
  end

  

end
