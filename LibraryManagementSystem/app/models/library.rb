class Library < ApplicationRecord
  has_many :lib_books, dependent: :delete_all
  # has_many :reservations, dependent: delete_all

  attr_accessor :option
  validates :name, :presence => true
  validates :university, :presence => true
  validates :location, :presence => true
  validates :max_days_undergrad, :presence => true, :numericality => { :greater_than_or_equal_to => 0 }
  validates :max_days_grad, :presence => true, :numericality => { :greater_than_or_equal_to => 0 }
  validates :max_days_phd, :presence => true, :numericality => { :greater_than_or_equal_to => 0 }
end