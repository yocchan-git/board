require "test_helper"

class UserTest < ActiveSupport::TestCase
  def setup
    @user = User.new(name: "よっちゃん", email: "yotyan@google.com", password:"yoshiyoshi", image: "default.jpg")
  end

  test "@user is validate" do
    assert @user.valid?
  end

  test "name present nonblank" do
    @user.name = "      "
    assert_not @user.valid?
  end

  test "name reject invalid data(toolong)" do
    @user.name = "a" * 51
    assert_not @user.valid?
  end

  test "email present nonblank" do
    @user.email = "     "
    assert_not @user.valid?
  end

  test "email reject invalid data (toolong)" do
    @user.email = "a" * 244 + "@example.com"
    assert_not @user.valid?
  end

  test "valid email should true" do
    validate_addresses = %w[user@example.com USER@foo.COM A_US-ER@foo.bar.org
                        first.last@foo.jp alice+bob@baz.cn]
    validate_addresses.each do |validate_address|
      @user.email = validate_address
      assert @user.valid?
    end
  end

  test "invalid email reject" do
    invalid_addresses = %w[user@example,com user_at_foo.org user.name@example.
                           foo@bar_baz.com foo@bar+baz.com]
    invalid_addresses.each do |invalid_address|
      @user.email = invalid_address
      assert_not @user.valid?
    end
  end

  test "email should downcase" do
    upcase_email = "FoO@BaR.COM"
    @user.email = upcase_email
    @user.save
    assert_equal @user.reload.email, upcase_email.downcase
  end

  test "password present nonblank" do
    @user.password = "   "
    assert_not @user.valid?
  end

  test "password should not too short minimum" do
    @user.password = "a" * 5
    assert_not @user.valid?
  end
end
