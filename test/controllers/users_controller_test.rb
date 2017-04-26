require 'test_helper'

class UsersControllerTest < ActionController::TestCase
  def setup
    admin_log_in
  end

  test "should get index" do
    get :index
    assert_response :success
  end

  test "should get new" do
    assert @user.role?(:admin)
    get :new
    assert_response :success
  end

  test "should get show" do
    get :show, id: @user.id
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @user.id
    assert_response :success
  end
end
