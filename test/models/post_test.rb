require "test_helper"

class PostTest < ActiveSupport::TestCase
  def setup
    @post = Post.new(title: "やると言ったらやる", content: "やるorめっちゃやる")
  end

  test "title present nonblank" do
    @post.title = ""
    assert_not @post.valid?
  end

  test "title should not be too long" do
    @post.title = "a" * 26
    assert_not @post.valid?
  end

  test "content present nonblank" do
    @post.content = ""
    assert_not @post.valid?
  end

  test "content should not be too long" do
    @post.content = "a" * 141
    assert_not @post.valid?
  end
end
