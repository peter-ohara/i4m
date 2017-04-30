require 'test_helper'

class SavedTBillsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @saved_t_bill = saved_t_bills(:one)
  end

  test "should get index" do
    get saved_t_bills_url
    assert_response :success
  end

  test "should get new" do
    get new_saved_t_bill_url
    assert_response :success
  end

  test "should create saved_t_bill" do
    assert_difference('SavedTBill.count') do
      post saved_t_bills_url, params: { saved_t_bill: { bank_of_ghana_rate_id: @saved_t_bill.bank_of_ghana_rate_id, principal_pesewas: @saved_t_bill.principal_pesewas, tenure: @saved_t_bill.tenure, user_id: @saved_t_bill.user_id } }
    end

    assert_redirected_to saved_t_bill_url(SavedTBill.last)
  end

  test "should show saved_t_bill" do
    get saved_t_bill_url(@saved_t_bill)
    assert_response :success
  end

  test "should get edit" do
    get edit_saved_t_bill_url(@saved_t_bill)
    assert_response :success
  end

  test "should update saved_t_bill" do
    patch saved_t_bill_url(@saved_t_bill), params: { saved_t_bill: { bank_of_ghana_rate_id: @saved_t_bill.bank_of_ghana_rate_id, principal_pesewas: @saved_t_bill.principal_pesewas, tenure: @saved_t_bill.tenure, user_id: @saved_t_bill.user_id } }
    assert_redirected_to saved_t_bill_url(@saved_t_bill)
  end

  test "should destroy saved_t_bill" do
    assert_difference('SavedTBill.count', -1) do
      delete saved_t_bill_url(@saved_t_bill)
    end

    assert_redirected_to saved_t_bills_url
  end
end
