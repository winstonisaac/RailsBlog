require 'test_helper'

class DeleteStoryTest < ActionDispatch::IntegrationTest
  test 'Should go to story and delete story' do
    story = stories(:one)
    comment = story.comments.build(content:"Test!")
    comment.save
    assert_difference 'story.comments.count', -1 do
      delete story_comment_path(story, comment)
      assert_response :redirect
    end
    follow_redirect!
    assert_response :success
  end
end