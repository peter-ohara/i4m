require 'test_helper'

class FixedDepositInvestmentsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @fixed_deposit_investment = fixed_deposit_investments(:one)
  end

  test "should get index" do
    get fixed_deposit_investments_url
    assert_response :success
  end

  test "should get new" do
    get new_fixed_deposit_investment_url
    assert_response :success
  end

  test "should create fixed_deposit_investment" do
    assert_difference('FixedDepositInvestment.count') do
      post fixed_deposit_investments_url, params: { fixed_deposit_investment: { description: @fixed_deposit_investment.description, email: @fixed_deposit_investment.email, institution_id: @fixed_deposit_investment.institution_id, links: @fixed_deposit_investment.links, minimum_principal_pesewas: @fixed_deposit_investment.minimum_principal_pesewas, name: @fixed_deposit_investment.name, period_in_days: @fixed_deposit_investment.period_in_days, phone_number: @fixed_deposit_investment.phone_number, risk_rating: @fixed_deposit_investment.risk_rating } }
    end

    assert_redirected_to fixed_deposit_investment_url(FixedDepositInvestment.last)
  end

  test "should show fixed_deposit_investment" do
    get fixed_deposit_investment_url(@fixed_deposit_investment)
    assert_response :success
  end

  test "should get edit" do
    get edit_fixed_deposit_investment_url(@fixed_deposit_investment)
    assert_response :success
  end

  test "should update fixed_deposit_investment" do
    patch fixed_deposit_investment_url(@fixed_deposit_investment), params: { fixed_deposit_investment: { description: @fixed_deposit_investment.description, email: @fixed_deposit_investment.email, institution_id: @fixed_deposit_investment.institution_id, links: @fixed_deposit_investment.links, minimum_principal_pesewas: @fixed_deposit_investment.minimum_principal_pesewas, name: @fixed_deposit_investment.name, period_in_days: @fixed_deposit_investment.period_in_days, phone_number: @fixed_deposit_investment.phone_number, risk_rating: @fixed_deposit_investment.risk_rating } }
    assert_redirected_to fixed_deposit_investment_url(@fixed_deposit_investment)
  end

  test "should destroy fixed_deposit_investment" do
    assert_difference('FixedDepositInvestment.count', -1) do
      delete fixed_deposit_investment_url(@fixed_deposit_investment)
    end

    assert_redirected_to fixed_deposit_investments_url
  end
end
