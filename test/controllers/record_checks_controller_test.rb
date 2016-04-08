require 'test_helper'

class RecordChecksControllerTest < ActionController::TestCase
  setup do
    @record_check = record_checks(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:record_checks)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create record_check" do
    assert_difference('RecordCheck.count') do
      post :create, record_check: { DOB: @record_check.DOB, address: @record_check.address, ageMax: @record_check.ageMax, ageMin: @record_check.ageMin, city: @record_check.city, county: @record_check.county, exactMatch: @record_check.exactMatch, firstName: @record_check.firstName, lastName: @record_check.lastName, limit: @record_check.limit, middleName: @record_check.middleName, state: @record_check.state, zip: @record_check.zip }
    end

    assert_redirected_to record_check_path(assigns(:record_check))
  end

  test "should show record_check" do
    get :show, id: @record_check
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @record_check
    assert_response :success
  end

  test "should update record_check" do
    patch :update, id: @record_check, record_check: { DOB: @record_check.DOB, address: @record_check.address, ageMax: @record_check.ageMax, ageMin: @record_check.ageMin, city: @record_check.city, county: @record_check.county, exactMatch: @record_check.exactMatch, firstName: @record_check.firstName, lastName: @record_check.lastName, limit: @record_check.limit, middleName: @record_check.middleName, state: @record_check.state, zip: @record_check.zip }
    assert_redirected_to record_check_path(assigns(:record_check))
  end

  test "should destroy record_check" do
    assert_difference('RecordCheck.count', -1) do
      delete :destroy, id: @record_check
    end

    assert_redirected_to record_checks_path
  end
end
