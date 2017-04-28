require 'test_helper'

class TBillsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @t_bill = t_bills(:one)
  end

  test "should get index" do
    get t_bills_url
    assert_response :success
  end

  test "should get new" do
    get new_t_bill_url
    assert_response :success
  end

  test "should create t_bill" do
    assert_difference('TBill.count') do
      post t_bills_url, params: { t_bill: { principal: @t_bill.principal, tenure: @t_bill.tenure } }
    end

    assert_redirected_to t_bill_url(TBill.last)
  end

  test "should show t_bill" do
    get t_bill_url(@t_bill)
    assert_response :success
  end

  test "should get edit" do
    get edit_t_bill_url(@t_bill)
    assert_response :success
  end

  test "should update t_bill" do
    patch t_bill_url(@t_bill), params: { t_bill: { principal: @t_bill.principal, tenure: @t_bill.tenure } }
    assert_redirected_to t_bill_url(@t_bill)
  end

  test "should destroy t_bill" do
    assert_difference('TBill.count', -1) do
      delete t_bill_url(@t_bill)
    end

    assert_redirected_to t_bills_url
  end
end
