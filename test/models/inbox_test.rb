require 'test_helper'

class InboxTest < ActiveSupport::TestCase
    def setup
      @conversation = Conversation.new
      @role = roles(:admin)
      @role.save!
      rids = [@role.id]
      @user1 = User.new(username: "test_user", email: "example@example.com", name: "Test User Name",
                        password: "password", password_confirmation: "password", role_ids: rids)
      @user1.save!
      @role = roles(:student)
      @role.save!
      rids = [@role.id]
      @user2 = User.new(username: "test_stud", email: "example@example.com", name: "Test User Name",
                        password: "password", password_confirmation: "password", role_ids: rids)
      @user2.save!

      users = [@user1.id, @user2.id]
      @conversation.user_ids = users
    end

    test 'messages can be read or unread for different users' do
      message = Message.new
      message.recipient_id = Recipient.where(user_id: @user1.id).first
      message.conversation_id = @conversation.id
      message.save

      inbox1 = Inbox.where(recipient_id: message.recipient_id).first
      inbox1.read = true

      inbox2 = Inbox.where(recipient_id: Recipient.where(user_id: @user2.id).first).first

      assert_not_equal inbox1.read, inbox2.read
    end
end
