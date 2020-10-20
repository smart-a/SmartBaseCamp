require "application_system_test_case"

class AppThreadsTest < ApplicationSystemTestCase
  setup do
    @app_thread = app_threads(:one)
  end

  test "visiting the index" do
    visit app_threads_url
    assert_selector "h1", text: "App Threads"
  end

  test "creating a App thread" do
    visit app_threads_url
    click_on "New App Thread"

    fill_in "Project", with: @app_thread.project_id
    fill_in "Th content", with: @app_thread.th_content
    click_on "Create App thread"

    assert_text "App thread was successfully created"
    click_on "Back"
  end

  test "updating a App thread" do
    visit app_threads_url
    click_on "Edit", match: :first

    fill_in "Project", with: @app_thread.project_id
    fill_in "Th content", with: @app_thread.th_content
    click_on "Update App thread"

    assert_text "App thread was successfully updated"
    click_on "Back"
  end

  test "destroying a App thread" do
    visit app_threads_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "App thread was successfully destroyed"
  end
end
