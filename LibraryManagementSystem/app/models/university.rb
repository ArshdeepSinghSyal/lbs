class University < ApplicationRecord
  has_many :libraries, dependent: :delete_all
  has_many :users, dependent: :delete_all

  validates :name, :presence => true
  validates :ug_books_limit, :presence => true
  validates :grad_books_limit, :presence => true
  validates :phd_books_limit, :presence => true
end
