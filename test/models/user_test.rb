require 'test_helper'

class UserTest < ActiveSupport::TestCase

  def setup
    @role = roles(:admin)
    @role.save!
    rids = [@role.id]
    @user = User.new(username: "test_user", email: "example@example.com", name: "Test User Name",
                      password: "password", password_confirmation: "password", role_ids: rids)
    @user.save!
  end

  test "user should be valid" do
    assert @user.valid?
  end

  test "username should be present" do
    @user.username = " "
    assert_not @user.valid?
  end

  test "email should be present" do
    @user.email = " "
    assert_not @user.valid?
  end

  test "name should be present" do
    @user.name = " "
    assert_not @user.valid?
  end

  test "name should not be too long" do
    @user.name = "x" * 51
    assert_not @user.valid?
  end

  test "username should not be too long" do
    @user.username = "x" * 11
    assert_not @user.valid?
  end

  test "email should not be too long" do
    @user.email = "x" * 255
    assert_not @user.valid?
  end

  # test "password should not be blank" do
  #   @user.password = @user.password_confirmation = " " * 6
  #   assert_not @user.valid?
  # end
  #
  # test "password should not be too short" do
  #   @user.password = @user.password_confirmation = "x" * 7
  #   assert_not @user.valid?
  # end

  test "username should be unique" do
    duplicate_user = @user.dup
    duplicate_user.email = @user.email.upcase
    @user.save
    assert_not duplicate_user.valid?
  end

  test "emails should be saved as lowercase" do
    mixed_case_email = "TeSt@tEsT.cOm"
    @user.email = mixed_case_email
    @user.save
    assert_equal mixed_case_email.downcase, @user.reload.email
  end

  test "usernames should be saved as lowercase" do
    mixed_case_username = "tEsTNaMe"
    @user.username = mixed_case_username
    @user.save
    assert_equal mixed_case_username.downcase, @user.reload.username
  end

  test 'user should have a role' do
    @user.role_ids = nil
    assert_not @user.valid?
  end

end
