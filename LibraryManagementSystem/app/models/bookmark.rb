class Bookmark < ApplicationRecord
  belongs_to :user
  belongs_to :lib_book
end
