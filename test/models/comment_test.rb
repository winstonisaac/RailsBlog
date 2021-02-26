require "test_helper"

class CommentTest < ActiveSupport::TestCase
  test "Content should not be blank" do
    comment = Comment.new(content: "", story_id: 1)
    assert_not comment.save
  end
end
