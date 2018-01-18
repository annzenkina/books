json.extract! book, :id, :title, :author, :year, :paper_online, :price, :discount, :created_at, :updated_at
json.url book_url(book, format: :json)
