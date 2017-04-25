require 'test_helper'

class MessageTest < ActiveSupport::TestCase

  def setup
    @role = roles(:admin)
    @role.save!
    rids = [@role.id]
    @user = User.new(username: "test_user", email: "example@example.com", name: "Test User Name",
                      password: "password", password_confirmation: "password", role_ids: rids)
    @user.save!

    @conversation = Conversation.new
    @conversation.save

    @sender = Recipient.new
    @sender.conversation_id = @conversation.id
    @sender.user_id = @user.id
    @sender.save
    @message = Message.new
    @message.conversation_id = @conversation.id
    @message.body = "This is the body."
    @message.recipient_id = @sender.id
    @message.save!
  end

  test 'message should be valid' do
    assert @message.valid?
  end

  test 'message should have a sender' do
    @message.recipient_id = nil
    assert_not @message.valid?
    @message.recipient_id = @sender.id
    @message.save
  end

  test 'body should be present' do
    @message.body = "";
    assert_not @message.valid?
  end

  test 'body should not be white space' do
    @message.body = "
      "
      assert_not @message.valid?
  end

  test 'body should be valid with one character' do
    @message.body = "a"
    assert @message.valid?
  end

  test 'body should be less than 1000 characters' do
    @message.body = "a"*1000
    assert @message.valid?
  end

  test 'body should not be too long' do
    @message.body = "a"*1001
    assert_not @message.valid?
  end

end
