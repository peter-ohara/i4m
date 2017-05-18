require 'test_helper'

class FixedDepositRatesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @fixed_deposit_rate = fixed_deposit_rates(:one)
  end

  test "should get index" do
    get fixed_deposit_rates_url
    assert_response :success
  end

  test "should get new" do
    get new_fixed_deposit_rate_url
    assert_response :success
  end

  test "should create fixed_deposit_rate" do
    assert_difference('FixedDepositRate.count') do
      post fixed_deposit_rates_url, params: { fixed_deposit_rate: { fixed_deposit_investment_id: @fixed_deposit_rate.fixed_deposit_investment_id, interest_rate: @fixed_deposit_rate.interest_rate, start_date: @fixed_deposit_rate.start_date } }
    end

    assert_redirected_to fixed_deposit_rate_url(FixedDepositRate.last)
  end

  test "should show fixed_deposit_rate" do
    get fixed_deposit_rate_url(@fixed_deposit_rate)
    assert_response :success
  end

  test "should get edit" do
    get edit_fixed_deposit_rate_url(@fixed_deposit_rate)
    assert_response :success
  end

  test "should update fixed_deposit_rate" do
    patch fixed_deposit_rate_url(@fixed_deposit_rate), params: { fixed_deposit_rate: { fixed_deposit_investment_id: @fixed_deposit_rate.fixed_deposit_investment_id, interest_rate: @fixed_deposit_rate.interest_rate, start_date: @fixed_deposit_rate.start_date } }
    assert_redirected_to fixed_deposit_rate_url(@fixed_deposit_rate)
  end

  test "should destroy fixed_deposit_rate" do
    assert_difference('FixedDepositRate.count', -1) do
      delete fixed_deposit_rate_url(@fixed_deposit_rate)
    end

    assert_redirected_to fixed_deposit_rates_url
  end
end
