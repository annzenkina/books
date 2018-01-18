json.extract! wishlist, :id, :book_id, :read_or_not, :created_at, :updated_at
json.url wishlist_url(wishlist, format: :json)
