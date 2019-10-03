class Reservation < ApplicationRecord
  belongs_to :lib_book
  belongs_to :user

  attr_accessor :fine
end
