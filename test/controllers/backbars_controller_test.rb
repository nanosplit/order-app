require 'test_helper'

class BackbarsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @backbar = backbars(:one)
  end

  test "should get index" do
    get backbars_url
    assert_response :success
  end

  test "should get new" do
    get new_backbar_url
    assert_response :success
  end

  test "should create backbar" do
    assert_difference('Backbar.count') do
      post backbars_url, params: { backbar: { price: @backbar.price, product_id: @backbar.product_id, venue_id: @backbar.venue_id } }
    end

    assert_redirected_to backbar_url(Backbar.last)
  end

  test "should show backbar" do
    get backbar_url(@backbar)
    assert_response :success
  end

  test "should get edit" do
    get edit_backbar_url(@backbar)
    assert_response :success
  end

  test "should update backbar" do
    patch backbar_url(@backbar), params: { backbar: { price: @backbar.price, product_id: @backbar.product_id, venue_id: @backbar.venue_id } }
    assert_redirected_to backbar_url(@backbar)
  end

  test "should destroy backbar" do
    assert_difference('Backbar.count', -1) do
      delete backbar_url(@backbar)
    end

    assert_redirected_to backbars_url
  end
end
