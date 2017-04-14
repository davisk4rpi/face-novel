require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest
  def setup
    @user = users(:tom)
    sign_in @user
  end

  test "should get index" do
    get users_url
    assert_response :success
  end

  test "should get show" do
    get users_show_url
    assert_response :success
  end

  test "should get edit" do
    get users_edit_url
    assert_response :success
  end

end
