require 'test_helper'

class ConversationTest < ActiveSupport::TestCase
  def setup
    @role = roles(:admin)
    @role.save!
    rids = [@role.id]
    @user1 = User.new(username: "test_user", email: "example@example.com", name: "Test User Name",
                      password: "password", password_confirmation: "password", role_ids: rids)
    @user1.save!
    @conversation = Conversation.new
  end

  test 'conversation should have at least two recipients' do
    assert_not @conversation.valid?
    @role = roles(:student)
    @role.save!
    rids = [@role.id]
    @user2 = User.new(username: "test_stud", email: "example@example.com", name: "Test User Name",
                      password: "password", password_confirmation: "password", role_ids: rids)
    @user2.save!

    users = [@user1.id, @user2.id]
    @conversation.user_ids = users
    assert @conversation.valid?
  end
end
