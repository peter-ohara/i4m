require 'test_helper'

class PurchasedTBillsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @purchased_t_bill = purchased_t_bills(:one)
  end

  test "should get index" do
    get purchased_t_bills_url
    assert_response :success
  end

  test "should get new" do
    get new_purchased_t_bill_url
    assert_response :success
  end

  test "should create purchased_t_bill" do
    assert_difference('PurchasedTBill.count') do
      post purchased_t_bills_url, params: { purchased_t_bill: { bank_of_ghana_rate_id: @purchased_t_bill.bank_of_ghana_rate_id, principal_pesewas: @purchased_t_bill.principal_pesewas, tenure: @purchased_t_bill.tenure, user_id: @purchased_t_bill.user_id } }
    end

    assert_redirected_to purchased_t_bill_url(PurchasedTBill.last)
  end

  test "should show purchased_t_bill" do
    get purchased_t_bill_url(@purchased_t_bill)
    assert_response :success
  end

  test "should get edit" do
    get edit_purchased_t_bill_url(@purchased_t_bill)
    assert_response :success
  end

  test "should update purchased_t_bill" do
    patch purchased_t_bill_url(@purchased_t_bill), params: { purchased_t_bill: { bank_of_ghana_rate_id: @purchased_t_bill.bank_of_ghana_rate_id, principal_pesewas: @purchased_t_bill.principal_pesewas, tenure: @purchased_t_bill.tenure, user_id: @purchased_t_bill.user_id } }
    assert_redirected_to purchased_t_bill_url(@purchased_t_bill)
  end

  test "should destroy purchased_t_bill" do
    assert_difference('PurchasedTBill.count', -1) do
      delete purchased_t_bill_url(@purchased_t_bill)
    end

    assert_redirected_to purchased_t_bills_url
  end
end
