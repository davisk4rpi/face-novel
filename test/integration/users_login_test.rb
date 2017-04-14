require 'test_helper'

class UsersLoginTest < ActionDispatch::IntegrationTest
  def setup
    post user_registration_path, params: { user: { name:  "Tester",
                                           email: "user@valid.com",
                                           password:              "foobar",
                                           password_confirmation: "foobar" } }
    sign_out :user
  end

  test "should get redirected" do
    get users_edit_url
    assert_response :redirect
    assert_redirected_to new_user_session_path
    get new_user_registration_path
    assert_response :success
  end

  test "successful login" do
    get new_user_session_path
    assert_response :success do
      post user_session_path, params: { user: { email:    "user@invalid.com",
                                                password: "foobar",}}
      assert_redirected_to root_path
    end
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
