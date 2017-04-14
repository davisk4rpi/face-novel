require 'test_helper'

class UsersSignupTest < ActionDispatch::IntegrationTest
  # test "the truth" do
  #   assert true
  # end
  test "invalid signup information" do
    get new_user_registration_path
    assert_no_difference 'User.count' do
      post user_registration_path, params: { user: { name:  "",
                                             email: "user@invalid",
                                             password:              "foo",
                                             password_confirmation: "bar" } }
    end
    assert_template 'users/registrations/new'
  end

  test "valid signup information" do
    get new_user_registration_path
    assert_difference "User.count", 1 do
      post user_registration_path, params: { user: { name:  "Tester",
                                             email: "user@valid.com",
                                             password:              "foobar",
                                             password_confirmation: "foobar" } }
    end
    assert_redirected_to  root_path
  end
end
