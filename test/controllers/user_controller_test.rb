require "test_helper"

class UserControllerTest < ActionDispatch::IntegrationTest
  def setup
    @user = users(:michael)
    @other_user = users(:inactive)
  end

  test "user get new" do
    get "/user/new"
    assert_response :success
  end

  test "user post create" do
    post "/user/new", params: { name: @user.name,
                                 email: @user.email,
                                 password: @user.password_digest}
    assert_not flash.empty?
    assert_redirected_to posts_path
  end
end
