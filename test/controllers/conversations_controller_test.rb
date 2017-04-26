require 'test_helper'

class ConversationsControllerTest < ActionController::TestCase
  def setup
    admin_log_in
    @user1 = @user
    @conversation = Conversation.new
    @role = roles(:student)
    @role.save!
    rids = [@role.id]
    @user2 = User.new(username: "test_stud", email: "example@example.com", name: "Test User Name",
                      password: "password", password_confirmation: "password", role_ids: rids)
    @user2.save!

    users = [@user1.id, @user2.id]
    @conversation.user_ids = users
    assert @conversation.valid?
    @conversation.save!
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

    get :show, id: @conversation.id
    assert_response :success
  end
end
