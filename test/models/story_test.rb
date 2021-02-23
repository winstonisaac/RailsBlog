require "test_helper"

class StoryTest < ActiveSupport::TestCase
  test "Title should not be blank" do
    post = Story.new(title: "", author: "Tester", body:"")
    assert_not post.save
  end

  test "Author should not be blank" do
    post = Story.new(title: "Test", author: "", body:"")
    assert_not post.save
  end

  test "Title should not be longer than 60 characters" do
    post = Story.new(title: "Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aee.", author: "Tester", body:"")
    assert_not post.save
  end

  test "Should save if no problems" do
    post = Story.new(title: "Test", author: "Tester", body:"")
    assert post.save
  end
end
