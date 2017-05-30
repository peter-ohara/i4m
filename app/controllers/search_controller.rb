class SearchController < ApplicationController
  def index
    principal = search_params[:principal]
    duration = search_params[:duration]
    search_query = search_params[:query]

    @fixed_deposit_investments = FixedDepositInvestment.filter(principal,
                                                               duration,
                                                               search_query)
    @mutual_funds = MutualFund.filter(principal,
                                      duration,
                                      search_query)
  end

  def save
    session[:principal] = params[:principal]
    session[:deposits] = params[:deposits]
    session[:duration] = params[:duration]
    session[:duration_multiplier] = params[:duration_multiplier]
  end

  def search_params
    params.permit(:principal, :duration, :query)
  end
end