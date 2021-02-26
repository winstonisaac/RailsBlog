require 'test_helper'

class UpdateStoryTest < ActionDispatch::IntegrationTest
  test 'Should go to story and update story' do
    story = stories(:one)
    get story_path(story)
    assert_response :success
    patch story_path(story), params: { story: {title: "Test!", author: "Testers", body: "Wow"}}
    story.reload
    assert_equal('Test!TestersWow', story.title+story.author+story.body)
  end
end