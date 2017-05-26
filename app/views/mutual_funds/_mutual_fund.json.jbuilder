json.extract! mutual_fund, :id, :institution_id, :name, :minimum_principal_pesewas, :debit_order_pesewas, :management_fee_rate, :min_days_before_withdrawal, :risk_rating, :links, :email, :phone_number, :description, :created_at, :updated_at
json.url mutual_fund_url(mutual_fund, format: :json)
