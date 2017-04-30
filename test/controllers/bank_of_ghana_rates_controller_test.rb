require 'test_helper'

class BankOfGhanaRatesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @bank_of_ghana_rate = bank_of_ghana_rates(:one)
  end

  test "should get index" do
    get bank_of_ghana_rates_url
    assert_response :success
  end

  test "should get new" do
    get new_bank_of_ghana_rate_url
    assert_response :success
  end

  test "should create bank_of_ghana_rate" do
    assert_difference('BankOfGhanaRate.count') do
      post bank_of_ghana_rates_url, params: { bank_of_ghana_rate: { discount_rate_182_days: @bank_of_ghana_rate.discount_rate_182_days, discount_rate_91_days: @bank_of_ghana_rate.discount_rate_91_days, end_date: @bank_of_ghana_rate.end_date, interest_rate_182_days: @bank_of_ghana_rate.interest_rate_182_days, interest_rate_91_days: @bank_of_ghana_rate.interest_rate_91_days, start_date: @bank_of_ghana_rate.start_date } }
    end

    assert_redirected_to bank_of_ghana_rate_url(BankOfGhanaRate.last)
  end

  test "should show bank_of_ghana_rate" do
    get bank_of_ghana_rate_url(@bank_of_ghana_rate)
    assert_response :success
  end

  test "should get edit" do
    get edit_bank_of_ghana_rate_url(@bank_of_ghana_rate)
    assert_response :success
  end

  test "should update bank_of_ghana_rate" do
    patch bank_of_ghana_rate_url(@bank_of_ghana_rate), params: { bank_of_ghana_rate: { discount_rate_182_days: @bank_of_ghana_rate.discount_rate_182_days, discount_rate_91_days: @bank_of_ghana_rate.discount_rate_91_days, end_date: @bank_of_ghana_rate.end_date, interest_rate_182_days: @bank_of_ghana_rate.interest_rate_182_days, interest_rate_91_days: @bank_of_ghana_rate.interest_rate_91_days, start_date: @bank_of_ghana_rate.start_date } }
    assert_redirected_to bank_of_ghana_rate_url(@bank_of_ghana_rate)
  end

  test "should destroy bank_of_ghana_rate" do
    assert_difference('BankOfGhanaRate.count', -1) do
      delete bank_of_ghana_rate_url(@bank_of_ghana_rate)
    end

    assert_redirected_to bank_of_ghana_rates_url
  end
end
