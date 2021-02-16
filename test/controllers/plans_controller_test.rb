require 'test_helper'

class PlansControllerTest < ActionDispatch::IntegrationTest
  setup do
    @plan = plans(:one)
  end

  test "should get index" do
    get plans_url, as: :json
    assert_response :success
  end

  test "should create plan" do
    assert_difference('Plan.count') do
      post plans_url, params: { plan: { date: @plan.date, description: @plan.description, location: @plan.location, name: @plan.name, time: @plan.time, user_id: @plan.user_id } }, as: :json
    end

    assert_response 201
  end

  test "should show plan" do
    get plan_url(@plan), as: :json
    assert_response :success
  end

  test "should update plan" do
    patch plan_url(@plan), params: { plan: { date: @plan.date, description: @plan.description, location: @plan.location, name: @plan.name, time: @plan.time, user_id: @plan.user_id } }, as: :json
    assert_response 200
  end

  test "should destroy plan" do
    assert_difference('Plan.count', -1) do
      delete plan_url(@plan), as: :json
    end

    assert_response 204
  end
end
