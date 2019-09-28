json.extract! lib_book, :id, :library_id, :book_id, :quantity, :created_at, :updated_at
json.url lib_book_url(lib_book, format: :json)
