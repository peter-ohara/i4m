json.extract! user, :id, :name, :phone_number_string, :created_at, :updated_at
json.url user_url(user, format: :json)
