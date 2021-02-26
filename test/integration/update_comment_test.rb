require 'test_helper'

class UpdateCommentTest < ActionDispatch::IntegrationTest
  test 'Should update comment if valid' do
    story = stories(:one)
    comment = story.comments.build(content:"Test!")
    comment.save
    patch story_comment_path(story, comment), params: { comment: { content:"test!"} }
    comment.reload
    assert_equal('test!', comment.content)
  end

  test 'Should not update comment if invalid' do
    story = stories(:one)
    comment = story.comments.build(content:"Test!")
    comment.save
    not_valid = patch story_comment_path(story, comment), params: { comment: { content:""} }
    assert_response :success
  end
end