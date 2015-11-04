require 'test_helper'

class TweetsControllerTest < ActionController::TestCase
  setup do
    @tweet = tweets(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:tweets)
  end

  test "should create tweet" do
    assert_difference('Tweet.count') do
      post :create, tweet: { body: @tweet.body }
    end

    assert_response 201
  end

  test "should show tweet" do
    get :show, id: @tweet
    assert_response :success
  end

  test "should update tweet" do
    put :update, id: @tweet, tweet: { body: @tweet.body }
    assert_response 204
  end

  test "should destroy tweet" do
    assert_difference('Tweet.count', -1) do
      delete :destroy, id: @tweet
    end

    assert_response 204
  end
end
