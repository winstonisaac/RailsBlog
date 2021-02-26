require 'test_helper'

class DeleteStoryTest < ActionDispatch::IntegrationTest
  test 'Should go to story and delete story' do
    story = stories(:one)
    get story_path(story), params: { story: {title: "Test", author: "Testers", body: ""}}
    assert_response :success
    assert_difference 'Story.count', -1 do
      delete story_path(story)
      assert_response :redirect
    end
    follow_redirect!
    assert_response :success
  end
end