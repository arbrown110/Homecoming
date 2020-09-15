require 'test_helper'

class SongsControllerTest < ActionDispatch::IntegrationTest
  test "should get artist" do
    get songs_artist_url
    assert_response :success
  end

  test "should get tune" do
    get songs_tune_url
    assert_response :success
  end

  test "should get playlist_id:integer" do
    get songs_playlist_id:integer_url
    assert_response :success
  end

end
