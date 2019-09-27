class LibBook < ApplicationRecord
  belongs_to :library
  belongs_to :book
  # self.primary_keys = :library_id, :book_id
end
