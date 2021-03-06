require 'test_helper'

class PostTest < ActiveSupport::TestCase

  def setup
    @user = users(:tom)
    # This code is not idiomatically correct.
    @post = Post.new(content: "Lorem ipsum", user_id: @user.id)
  end

  test "should be valid" do
    assert @post.valid?
  end

  test "user id should be present" do
    @post.user_id = nil
    assert_not @post.valid?
  end

end
