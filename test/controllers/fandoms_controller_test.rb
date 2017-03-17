require 'test_helper'

class FandomsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @fandom = fandoms(:one)
  end

  test "should get index" do
    get fandoms_url
    assert_response :success
  end

  test "should get new" do
    get new_fandom_url
    assert_response :success
  end

  test "should create fandom" do
    assert_difference('Fandom.count') do
      post fandoms_url, params: { fandom: { admin_id: @fandom.admin_id, artist_id: @fandom.artist_id, bg_img: @fandom.bg_img, description: @fandom.description, group_id: @fandom.group_id, name: @fandom.name, profile_img: @fandom.profile_img, subtitle: @fandom.subtitle, title: @fandom.title } }
    end

    assert_redirected_to fandom_url(Fandom.last)
  end

  test "should show fandom" do
    get fandom_url(@fandom)
    assert_response :success
  end

  test "should get edit" do
    get edit_fandom_url(@fandom)
    assert_response :success
  end

  test "should update fandom" do
    patch fandom_url(@fandom), params: { fandom: { admin_id: @fandom.admin_id, artist_id: @fandom.artist_id, bg_img: @fandom.bg_img, description: @fandom.description, group_id: @fandom.group_id, name: @fandom.name, profile_img: @fandom.profile_img, subtitle: @fandom.subtitle, title: @fandom.title } }
    assert_redirected_to fandom_url(@fandom)
  end

  test "should destroy fandom" do
    assert_difference('Fandom.count', -1) do
      delete fandom_url(@fandom)
    end

    assert_redirected_to fandoms_url
  end
end
