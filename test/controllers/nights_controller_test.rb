require 'test_helper'

class NightsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @night = nights(:one)
  end

  test "should get index" do
    get nights_url
    assert_response :success
  end

  test "should get new" do
    get new_night_url
    assert_response :success
  end

  test "should create night" do
    assert_difference('Night.count') do
      post nights_url, params: { night: {  } }
    end

    assert_redirected_to night_url(Night.last)
  end

  test "should show night" do
    get night_url(@night)
    assert_response :success
  end

  test "should get edit" do
    get edit_night_url(@night)
    assert_response :success
  end

  test "should update night" do
    patch night_url(@night), params: { night: {  } }
    assert_redirected_to night_url(@night)
  end

  test "should destroy night" do
    assert_difference('Night.count', -1) do
      delete night_url(@night)
    end

    assert_redirected_to nights_url
  end
end
