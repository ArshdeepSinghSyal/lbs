class Library < ApplicationRecord
  belongs_to :university
  has_many :lib_books, dependent: :delete_all

  attr_accessor :option
  validates :name, :presence => true, uniqueness: true
  validates :university, :presence => true
  validates :location, :presence => true
  validates :fine, :presence => true
  validates :max_days, :presence => true, :numericality => { :greater_than_or_equal_to => 0 }
end
