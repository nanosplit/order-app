json.extract! order, :id, :venue_id, :user_id, :total, :products, :created_at, :updated_at
json.url order_url(order, format: :json)