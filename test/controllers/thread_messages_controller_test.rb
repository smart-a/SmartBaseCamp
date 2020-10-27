require 'test_helper'

class ThreadMessagesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @thread_message = thread_messages(:one)
  end

  test "should get index" do
    get thread_messages_url
    assert_response :success
  end

  test "should get new" do
    get new_thread_message_url
    assert_response :success
  end

  test "should create thread_message" do
    assert_difference('ThreadMessage.count') do
      post thread_messages_url, params: { thread_message: { thread_id: @thread_message.thread_id, tm_content: @thread_message.tm_content } }
    end

    assert_redirected_to thread_message_url(ThreadMessage.last)
  end

  test "should show thread_message" do
    get thread_message_url(@thread_message)
    assert_response :success
  end

  test "should get edit" do
    get edit_thread_message_url(@thread_message)
    assert_response :success
  end

  test "should update thread_message" do
    patch thread_message_url(@thread_message), params: { thread_message: { thread_id: @thread_message.thread_id, tm_content: @thread_message.tm_content } }
    assert_redirected_to thread_message_url(@thread_message)
  end

  test "should destroy thread_message" do
    assert_difference('ThreadMessage.count', -1) do
      delete thread_message_url(@thread_message)
    end

    assert_redirected_to thread_messages_url
  end
end
