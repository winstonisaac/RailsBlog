require 'test_helper'

class CreateCommentTest < ActionDispatch::IntegrationTest
  test 'Should create new comment and redirect to story' do
    story = stories(:one)
    get new_story_comment_path(story)
    assert_response :success
    assert_difference 'story.comments.count', 1 do
      post story_comments_path, params: { comment: {content: "Test"}}
      assert_response :redirect
    end
    follow_redirect!
    assert_response :success
  end
end