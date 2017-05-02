json.extract! user, :id, :name, :phone_number, :auth_token
json.url user_url(user, format: :json)
