require 'test_helper'

class CreateStoryTest < ActionDispatch::IntegrationTest
  test 'Should go to new story form and create story' do
    get new_story_path
    assert_response :success
    assert_difference 'Story.count', 1 do
      post stories_path, params: { story: {title: "Test", author: "Tester", body: ""}}
      assert_response :redirect
    end
    follow_redirect!
    assert_response :success
  end
end