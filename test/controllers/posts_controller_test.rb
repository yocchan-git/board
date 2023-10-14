require "test_helper"

class PostsControllerTest < ActionDispatch::IntegrationTest
    def setup
        @post = posts(:post_one)
        @user = users(:michael)
        @other_user = users(:inactive)
    end

    test "index redirect login when not login" do
        get posts_path
        assert_redirected_to login_path
    end

    test "show redirect login when not login" do
        get post_path(@post)
        assert_redirected_to login_path
    end

    test "new redirect login when not login" do
        get new_post_path(@post)
        assert_redirected_to login_path
    end

    test "create redirect login when not login" do
        post "/posts", params: { title: @post.title,
                                 content: @post.content,
                                 user_id: @post.user_id}
        assert_redirected_to login_path
    end

    test "edit redirect login when not login" do
        get edit_post_path(@post)
        assert_redirected_to login_path
    end

    test "update redirect login when not login" do
        patch "/posts/#{@post.id}"
        assert_redirected_to login_path
    end

    test "destroy redirect login when not login" do
        delete "/posts/#{@post.id}"
        assert_redirected_to login_path
    end

    #TODO 以下のコードを動くようにする
    # test "edit redirect posts index when not current_user" do
    #     log_in_as(@other_user)
    #     get edit_post_path(@post)
    #     assert_not flash.empty?
    #     assert_redirected_to posts_path
    # end

end
