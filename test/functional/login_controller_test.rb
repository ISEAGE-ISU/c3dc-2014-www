require 'test_helper'

class LoginControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
  end

  test "should get in" do
    get :in
    assert_response :success
  end

  test "should get out" do
    get :out
    assert_response :success
  end

end
