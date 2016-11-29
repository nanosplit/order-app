json.extract! cart, :id, :user_id, :venue_id, :products, :created_at, :updated_at
json.url cart_url(cart, format: :json)