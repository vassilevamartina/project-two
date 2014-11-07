require 'test_helper'

class UserControllerTest < ActionController::TestCase
  test "should get email" do
    get :email
    assert_response :success
  end

  test "should get password_confirmation" do
    get :password_confirmation
    assert_response :success
  end

end
