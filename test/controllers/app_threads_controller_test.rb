require 'test_helper'

class AppThreadsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @app_thread = app_threads(:one)
  end

  test "should get index" do
    get app_threads_url
    assert_response :success
  end

  test "should get new" do
    get new_app_thread_url
    assert_response :success
  end

  test "should create app_thread" do
    assert_difference('AppThread.count') do
      post app_threads_url, params: { app_thread: { project_id: @app_thread.project_id, th_content: @app_thread.th_content } }
    end

    assert_redirected_to app_thread_url(AppThread.last)
  end

  test "should show app_thread" do
    get app_thread_url(@app_thread)
    assert_response :success
  end

  test "should get edit" do
    get edit_app_thread_url(@app_thread)
    assert_response :success
  end

  test "should update app_thread" do
    patch app_thread_url(@app_thread), params: { app_thread: { project_id: @app_thread.project_id, th_content: @app_thread.th_content } }
    assert_redirected_to app_thread_url(@app_thread)
  end

  test "should destroy app_thread" do
    assert_difference('AppThread.count', -1) do
      delete app_thread_url(@app_thread)
    end

    assert_redirected_to app_threads_url
  end
end
