class LibBook < ApplicationRecord
  belongs_to :library
  belongs_to :book
  has_many :reservations
  # self.primary_keys = :library_id, :book_id
  validates :book, uniqueness: { scope: :library }
end
