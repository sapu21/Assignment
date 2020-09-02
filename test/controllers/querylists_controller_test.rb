require 'test_helper'

class QuerylistsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @querylist = querylists(:one)
  end

  test "should get index" do
    get querylists_url
    assert_response :success
  end

  test "should get new" do
    get new_querylist_url
    assert_response :success
  end

  test "should create querylist" do
    assert_difference('Querylist.count') do
      post querylists_url, params: { querylist: { emailaddres: @querylist.emailaddres, query: @querylist.query } }
    end

    assert_redirected_to querylist_url(Querylist.last)
  end

  test "should show querylist" do
    get querylist_url(@querylist)
    assert_response :success
  end

  test "should get edit" do
    get edit_querylist_url(@querylist)
    assert_response :success
  end

  test "should update querylist" do
    patch querylist_url(@querylist), params: { querylist: { emailaddres: @querylist.emailaddres, query: @querylist.query } }
    assert_redirected_to querylist_url(@querylist)
  end

  test "should destroy querylist" do
    assert_difference('Querylist.count', -1) do
      delete querylist_url(@querylist)
    end

    assert_redirected_to querylists_url
  end
end
