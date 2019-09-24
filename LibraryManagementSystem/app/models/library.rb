class Library < ApplicationRecord
  attr_accessor :option
  validates :name, :presence => true
  validates :university, :presence => true
  validates :location, :presence => true
end
