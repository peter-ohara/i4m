require 'test_helper'

class MutualFundsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @mutual_fund = mutual_funds(:one)
  end

  test "should get index" do
    get mutual_funds_url
    assert_response :success
  end

  test "should get new" do
    get new_mutual_fund_url
    assert_response :success
  end

  test "should create mutual_fund" do
    assert_difference('MutualFund.count') do
      post mutual_funds_url, params: { mutual_fund: { debit_order_pesewas: @mutual_fund.debit_order_pesewas, description: @mutual_fund.description, email: @mutual_fund.email, institution_id: @mutual_fund.institution_id, links: @mutual_fund.links, management_fee_rate: @mutual_fund.management_fee_rate, min_days_before_withdrawal: @mutual_fund.min_days_before_withdrawal, minimum_principal_pesewas: @mutual_fund.minimum_principal_pesewas, name: @mutual_fund.name, phone_number: @mutual_fund.phone_number, risk_rating: @mutual_fund.risk_rating } }
    end

    assert_redirected_to mutual_fund_url(MutualFund.last)
  end

  test "should show mutual_fund" do
    get mutual_fund_url(@mutual_fund)
    assert_response :success
  end

  test "should get edit" do
    get edit_mutual_fund_url(@mutual_fund)
    assert_response :success
  end

  test "should update mutual_fund" do
    patch mutual_fund_url(@mutual_fund), params: { mutual_fund: { debit_order_pesewas: @mutual_fund.debit_order_pesewas, description: @mutual_fund.description, email: @mutual_fund.email, institution_id: @mutual_fund.institution_id, links: @mutual_fund.links, management_fee_rate: @mutual_fund.management_fee_rate, min_days_before_withdrawal: @mutual_fund.min_days_before_withdrawal, minimum_principal_pesewas: @mutual_fund.minimum_principal_pesewas, name: @mutual_fund.name, phone_number: @mutual_fund.phone_number, risk_rating: @mutual_fund.risk_rating } }
    assert_redirected_to mutual_fund_url(@mutual_fund)
  end

  test "should destroy mutual_fund" do
    assert_difference('MutualFund.count', -1) do
      delete mutual_fund_url(@mutual_fund)
    end

    assert_redirected_to mutual_funds_url
  end
end
