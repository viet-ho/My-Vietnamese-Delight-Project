json.extract! promo_item, :id, :name, :description, :image, :price, :created_at, :updated_at
json.url promo_item_url(promo_item, format: :json)
