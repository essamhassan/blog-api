require 'test_helper'

class PostsControllerTest < ActionController::TestCase
  test "should get create" do
    get :create
    assert_response :success
  end

  test "should get show" do
    get :show
    assert_response :success
  end

  test "should get like" do
    get :like
    assert_response :success
  end

end
