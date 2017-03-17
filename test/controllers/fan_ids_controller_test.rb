require 'test_helper'

class FanIdsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @fan_id = fan_ids(:one)
  end

  test "should get index" do
    get fan_ids_url
    assert_response :success
  end

  test "should get new" do
    get new_fan_id_url
    assert_response :success
  end

  test "should create fan_id" do
    assert_difference('FanId.count') do
      post fan_ids_url, params: { fan_id: { fan_img: @fan_id.fan_img, fandom_id: @fan_id.fandom_id, msg: @fan_id.msg, nickname: @fan_id.nickname, user_id: @fan_id.user_id } }
    end

    assert_redirected_to fan_id_url(FanId.last)
  end

  test "should show fan_id" do
    get fan_id_url(@fan_id)
    assert_response :success
  end

  test "should get edit" do
    get edit_fan_id_url(@fan_id)
    assert_response :success
  end

  test "should update fan_id" do
    patch fan_id_url(@fan_id), params: { fan_id: { fan_img: @fan_id.fan_img, fandom_id: @fan_id.fandom_id, msg: @fan_id.msg, nickname: @fan_id.nickname, user_id: @fan_id.user_id } }
    assert_redirected_to fan_id_url(@fan_id)
  end

  test "should destroy fan_id" do
    assert_difference('FanId.count', -1) do
      delete fan_id_url(@fan_id)
    end

    assert_redirected_to fan_ids_url
  end
end
