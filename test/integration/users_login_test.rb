require 'test_helper'

class UsersLoginTest < ActionDispatch::IntegrationTest
  def setup
    @user = users(:tom)
  end

  test "should get redirected" do
    get root_url
    assert_response :redirect
    assert_redirected_to new_user_session_path
    get new_user_registration_path
    assert_response :success
    assert_select "a[href=?]", new_user_session_path
    assert_select "a[href=?]", new_user_registration_path
  end

  test "successful login" do
    get new_user_session_path
    sign_in @user
    get root_path
    assert_select "a[href=?]", destroy_user_session_path
    assert_select "a[href=?]", user_path(@user.id)
    get user_path(@user)
    assert_select "a[href=?]", edit_user_registration_path
  end

  test "unsuccessful login" do
    get new_user_session_path
    assert_response :success do
      post user_session_path, params: { user: { email:    "user@invalid",
                                                password: "foo",}}
      assert_response 401
    end
    assert_template :new
  end

end
