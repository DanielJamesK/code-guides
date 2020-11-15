require 'test_helper'

class ProgrammingLanguagesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @programming_language = programming_languages(:one)
  end

  test "should get index" do
    get programming_languages_url
    assert_response :success
  end

  test "should get new" do
    get new_programming_language_url
    assert_response :success
  end

  test "should create programming_language" do
    assert_difference('ProgrammingLanguage.count') do
      post programming_languages_url, params: { programming_language: { description: @programming_language.description, name: @programming_language.name, user_id: @programming_language.user_id } }
    end

    assert_redirected_to programming_language_url(ProgrammingLanguage.last)
  end

  test "should show programming_language" do
    get programming_language_url(@programming_language)
    assert_response :success
  end

  test "should get edit" do
    get edit_programming_language_url(@programming_language)
    assert_response :success
  end

  test "should update programming_language" do
    patch programming_language_url(@programming_language), params: { programming_language: { description: @programming_language.description, name: @programming_language.name, user_id: @programming_language.user_id } }
    assert_redirected_to programming_language_url(@programming_language)
  end

  test "should destroy programming_language" do
    assert_difference('ProgrammingLanguage.count', -1) do
      delete programming_language_url(@programming_language)
    end

    assert_redirected_to programming_languages_url
  end
end
