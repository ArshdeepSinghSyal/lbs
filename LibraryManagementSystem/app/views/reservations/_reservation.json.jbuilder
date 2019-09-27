json.extract! reservation, :id, :lib_book_id, :user_id, :status, :checkoutstamp, :returnstamp, :requeststamp, :created_at, :updated_at
json.url reservation_url(reservation, format: :json)
