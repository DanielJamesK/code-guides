require "application_system_test_case"

class ProgrammingLanguagesTest < ApplicationSystemTestCase
  setup do
    @programming_language = programming_languages(:one)
  end

  test "visiting the index" do
    visit programming_languages_url
    assert_selector "h1", text: "Programming Languages"
  end

  test "creating a Programming language" do
    visit programming_languages_url
    click_on "New Programming Language"

    fill_in "Description", with: @programming_language.description
    fill_in "Name", with: @programming_language.name
    fill_in "User", with: @programming_language.user_id
    click_on "Create Programming language"

    assert_text "Programming language was successfully created"
    click_on "Back"
  end

  test "updating a Programming language" do
    visit programming_languages_url
    click_on "Edit", match: :first

    fill_in "Description", with: @programming_language.description
    fill_in "Name", with: @programming_language.name
    fill_in "User", with: @programming_language.user_id
    click_on "Update Programming language"

    assert_text "Programming language was successfully updated"
    click_on "Back"
  end

  test "destroying a Programming language" do
    visit programming_languages_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Programming language was successfully destroyed"
  end
end
