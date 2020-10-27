require "application_system_test_case"

class ThreadMessagesTest < ApplicationSystemTestCase
  setup do
    @thread_message = thread_messages(:one)
  end

  test "visiting the index" do
    visit thread_messages_url
    assert_selector "h1", text: "Thread Messages"
  end

  test "creating a Thread message" do
    visit thread_messages_url
    click_on "New Thread Message"

    fill_in "Thread", with: @thread_message.thread_id
    fill_in "Tm content", with: @thread_message.tm_content
    click_on "Create Thread message"

    assert_text "Thread message was successfully created"
    click_on "Back"
  end

  test "updating a Thread message" do
    visit thread_messages_url
    click_on "Edit", match: :first

    fill_in "Thread", with: @thread_message.thread_id
    fill_in "Tm content", with: @thread_message.tm_content
    click_on "Update Thread message"

    assert_text "Thread message was successfully updated"
    click_on "Back"
  end

  test "destroying a Thread message" do
    visit thread_messages_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Thread message was successfully destroyed"
  end
end
