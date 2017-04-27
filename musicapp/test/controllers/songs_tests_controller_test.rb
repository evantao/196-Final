require 'test_helper'

class SongsTestsControllerTest < ActionController::TestCase
  setup do
    @songs_test = songs_tests(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:songs_tests)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create songs_test" do
    assert_difference('SongsTest.count') do
      post :create, songs_test: { song_id: @songs_test.song_id, test_id: @songs_test.test_id }
    end

    assert_redirected_to songs_test_path(assigns(:songs_test))
  end

  test "should show songs_test" do
    get :show, id: @songs_test
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @songs_test
    assert_response :success
  end

  test "should update songs_test" do
    patch :update, id: @songs_test, songs_test: { song_id: @songs_test.song_id, test_id: @songs_test.test_id }
    assert_redirected_to songs_test_path(assigns(:songs_test))
  end

  test "should destroy songs_test" do
    assert_difference('SongsTest.count', -1) do
      delete :destroy, id: @songs_test
    end

    assert_redirected_to songs_tests_path
  end
end
