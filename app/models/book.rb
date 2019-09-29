class Book < ApplicationRecord
  has_many :lib_books, dependent: :delete_all

  validates :isbn, :presence => true, numericality: true, uniqueness: true
  validates :title, :presence => true
  validates :author, :presence => true
  validates :language, :presence => true
  validates :published, :presence => true
  validates :edition, :presence => true, numericality: true
  validates :image, :presence => true
  validates :subject, :presence => true
  validates :is_special_collection_item, :presence => true
end
