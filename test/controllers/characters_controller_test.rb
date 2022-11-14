require "test_helper"

class CharactersControllerTest < ActionDispatch::IntegrationTest
  test "should get name" do
    get characters_name_url
    assert_response :success
  end

  test "should get description" do
    get characters_description_url
    assert_response :success
  end

  test "should get price:integer" do
    get characters_price:integer_url
    assert_response :success
  end

  test "should get category" do
    get characters_category_url
    assert_response :success
  end
end
