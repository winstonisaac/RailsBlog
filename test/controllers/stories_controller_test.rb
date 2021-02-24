require "test_helper"

class StoriesControllerTest < ActionDispatch::IntegrationTest
  test "Should respond with HTTP code 200 when request goes to GET /stories" do
    get stories_path
    assert_response :success
  end
  test "Should redirect when valid entry to POST /stories" do
    post stories_path, params: { story: {title: "Test", author: "Tester", body: ""}}
    assert_response :redirect
  end
  test "Should not redirect when invalid entry to POST /stories" do
    post stories_path, params: { story: {title: "", author: "", body: ""}}
    assert_response :success
  end
  test "Should succeed on stories/new" do
    get new_story_path
    assert_response :success
  end
  test "Should success on edit" do
    story = Story.new(title: "Test", author: "Tester", body:"")
    story.save
    get edit_story_path(story)
    assert_response :success
  end
  test "Should succeed on show" do
    story = Story.new(title: "Test", author: "Tester", body:"")
    story.save
    get story_path(story), params: { story: {title: "Test", author: "Testers", body: ""}}
    assert_response :success
  end
  test "Should redirect when updating a story with valid fields" do
    story = Story.new(title: "Test", author: "Tester", body:"")
    story.save
    patch story_path(story), params: { story: {title: "Test", author: "Testers", body: ""}}
    assert_response :redirect
  end
  test "Should not redirect when updating a story with invalid fields" do
    story = Story.new(title: "Test", author: "Tester", body:"")
    story.save
    patch story_path(story), params: { story: {title: "Test", author: "", body: ""}}
    assert_response :success
  end
  test "Should redirect when updating a story with valid fields /put" do
    story = Story.new(title: "Test", author: "Tester", body:"")
    story.save
    put story_path(story), params: { story: {title: "Test", author: "Testers", body: ""}}
    assert_response :redirect
  end
  test "Should not redirect when updating a story with invalid fields /put" do
    story = Story.new(title: "Test", author: "Tester", body:"")
    story.save
    put story_path(story), params: { story: {title: "Test", author: "", body: ""}}
    assert_response :success
  end
  test "Should redirect after deletion" do
    story = Story.new(title: "Test", author: "Tester", body:"")
    story.save
    delete story_path(story)
    assert_response :redirect
  end
end
