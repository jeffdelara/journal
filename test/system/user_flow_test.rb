require "application_system_test_case"

class UserFlowTest < ApplicationSystemTestCase
  setup do 
    @user = users(:one)
  end

  test "visiting the index" do
    visit root_url
    assert_selector "h1", text: "Task begone!"
  end

  test "logging in" do 
    visit new_user_session_url 
    fill_in "Email", with: @user.email  
    fill_in "Password", with: "abc123"
    click_on "Log in"
    assert_selector "p", text: "Signed in successfully"
  end
end
