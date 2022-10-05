require "application_system_test_case"

class HomePagesTest < ApplicationSystemTestCase
  test "visiting the home page" do
    visit root_url

    assert_selector "h1", text: "Meet new asdf"
    open_screenshot
  end
end
