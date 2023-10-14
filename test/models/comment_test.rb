require "test_helper"

class CommentTest < ActiveSupport::TestCase
  def setup
    @comment = Comment.new(user_id: 1,post_id: 1,comment: "今日もお疲れ様です！")
  end

  test "comment present nonblank" do
    @comment.comment = ""
    assert_not @comment.valid?
  end

  test "comment should not be too long" do
    @comment.comment = "a" * 101
    assert_not @comment.valid?
  end
end
