class Bookmark < ApplicationRecord
  belongs_to :user
  belongs_to :lib_book

  validates :lib_book, uniqueness: { scope: :user }
end
